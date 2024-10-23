//
//  MLModel.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 22.10.24.
//

import Foundation
import Vision
import CoreML
import UIKit

//func recognizeObject(from image: UIImage, completion: @escaping (String) -> Void) {
//    guard let cgImage = image.cgImage else {
//        print("Не удалось преобразовать UIImage в CGImage.")
//        return
//    }
//
//    // Загружаем модель
//    guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
//        print("Не удалось загрузить модель.")
//        return
//    }
//
//    // Создаем запрос на классификацию объектов
//    let request = VNCoreMLRequest(model: model) { (request, error) in
//        guard let observations = request.results as? [VNClassificationObservation], error == nil else {
//            print("Ошибка классификации: \(String(describing: error))")
//            return
//        }
//
//        // Получаем наиболее вероятный результат
//        if let bestResult = observations.first {
//            let objectName = bestResult.identifier
//            completion(objectName)
//        }
//    }
//
//    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
//
//    DispatchQueue.global(qos: .userInitiated).async {
//        do {
//            try handler.perform([request])
//        } catch {
//            print("Ошибка при выполнении запроса: \(error)")
//        }
//    }
//}
//
