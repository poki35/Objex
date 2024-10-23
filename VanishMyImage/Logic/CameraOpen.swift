//
//  CameraOpen.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 22.10.24.
//

import Foundation
import SwiftUI
import UIKit
import Vision
import CoreML
import Alamofire

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var recognizedObject: String
    @Binding var translation: String
    let database: ObjectNameDatabase
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView
        
        init(parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
                
                // Распознаем объект после выбора изображения
                parent.recognizeObjects(from: image) { recognizedObjects in
                    DispatchQueue.main.async {
                        // Выбираем наиболее вероятное название объекта
                        if let bestObject = recognizedObjects.first {
                            self.parent.recognizedObject = bestObject
                        }
                        
                        // Переводим название объекта
                        self.parent.translateObjectName(self.parent.recognizedObject) { translation in
                            DispatchQueue.main.async {
                                self.parent.translation = translation
                            }
                        }
                    }
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraDevice = .rear
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Не требуется обновлять
    }
    
    // Функция для распознавания объектов с использованием обеих моделей
    func recognizeObjects(from image: UIImage, completion: @escaping ([String]) -> Void) {
        guard let cgImage = image.cgImage else {
            print("Не удалось преобразовать UIImage в CGImage.")
            return
        }
        
        // Создаем массив для хранения результатов
        var recognizedObjects: [String] = []

        // Загружаем модель MobileNetV2
        guard let mobileNetModel = try? VNCoreMLModel(for: MobileNetV2().model) else {
            print("Не удалось загрузить модель MobileNetV2.")
            return
        }
        
        // Загружаем модель ResNet50
        guard let resNetModel = try? VNCoreMLModel(for: Resnet50().model) else {
            print("Не удалось загрузить модель ResNet50.")
            return
        }

        // Создаем запросы для каждой модели
        let mobileNetRequest = VNCoreMLRequest(model: mobileNetModel) { (request, error) in
            if let observations = request.results as? [VNClassificationObservation], error == nil {
                if let bestResult = observations.first {
                    recognizedObjects.append(bestResult.identifier)
                }
            }
        }
        
        let resNetRequest = VNCoreMLRequest(model: resNetModel) { (request, error) in
            if let observations = request.results as? [VNClassificationObservation], error == nil {
                if let bestResult = observations.first {
                    recognizedObjects.append(bestResult.identifier)
                }
            }
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([mobileNetRequest, resNetRequest])
                // Убираем дубликаты и сортируем результаты по вероятности
                let uniqueResults = Array(Set(recognizedObjects))
                completion(uniqueResults)
            } catch {
                print("Ошибка при выполнении запроса: \(error)")
            }
        }
    }
    
    // Функция для перевода названия объекта
    func translateObjectName(_ objectName: String, completion: @escaping (String) -> Void) {
        // Сначала проверяем офлайн перевод
        let translationDictionary: [String: String] = [
            "apple": "яблоко",
            "table": "стол",
            "book": "книга",
            "car": "машина",
            "tree": "дерево",
            "laptop": "ноутбук"
            // Добавь сюда другие переводы
        ]
        
        if let offlineTranslation = translationDictionary[objectName.lowercased()] {
            completion(offlineTranslation)
            return
        }
        
        // Если офлайн перевод не найден, выполняем онлайн перевод
        let parameters: [String: Any] = [
            "q": objectName,
            "source": "en",
            "target": "ru",
            "format": "text"
        ]
        
        let url = "https://libretranslate.com/translate"
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Ответ от API: \(value)") // Добавлено для отладки
                if let json = value as? [String: Any], let translatedText = json["translatedText"] as? String {
                    completion(translatedText)
                } else {
                    completion("Не удалось получить перевод.")
                }
            case .failure(let error):
                print("Ошибка запроса: \(error.localizedDescription)")
                completion("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
