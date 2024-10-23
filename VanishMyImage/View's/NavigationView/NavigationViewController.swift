//
//  NavigationViewController.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 23.10.24.
//

import Foundation
import SwiftUI
import SnapKit
import Lottie
import Vision

//struct NavigationViewController: View {
//    @State private var isShowingCamera = false
//    @State private var image: UIImage?
//    @State private var recognizedObject: String = "No object recognized"
//    @State private var correctedObject: String = ""
//    @State private var isEditingObjectName = false
//    @State private var translation: String = "Translation will appear here"
//
//    // Инициализируем базу данных
//    private let database = ObjectNameDatabase()
//
//    var body: some View {
//        VStack {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
//            }
//
//            Text("Object: \(recognizedObject)")
//                .font(.headline)
//                .padding()
//
//            if isEditingObjectName {
//                TextField("Enter correct name", text: $correctedObject)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button("Save Correction") {
//                    saveCorrectedName()
//                }
//                .padding()
//                .background(Color.green)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//            } else {
//                Text("Translation: \(translation)")
//                    .font(.subheadline)
//                    .padding()
//            }
//
//            Button(action: {
//                isShowingCamera = true
//            }) {
//                Text("Open Camera")
//                    .font(.title)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//
//            Button(action: {
//                isEditingObjectName.toggle()
//            }) {
//                Text(isEditingObjectName ? "Cancel" : "Edit Object Name")
//                    .font(.subheadline)
//                    .padding()
//                    .background(Color.orange)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .sheet(isPresented: $isShowingCamera) {
//            CameraView(image: $image, recognizedObject: $recognizedObject, translation: $translation, database: database)
//        }
//    }
//
//    // Сохранение исправленного названия в базу данных
//    private func saveCorrectedName() {
//        database.saveCorrectedName(for: recognizedObject, correctedName: correctedObject)
//        recognizedObject = correctedObject
//        correctedObject = ""
//        isEditingObjectName = false
//    }
//}
