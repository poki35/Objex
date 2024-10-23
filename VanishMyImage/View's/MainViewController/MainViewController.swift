//
//  MainViewController.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 22.10.24.
//

import SwiftUI
import DotLottie

struct MainViewController: View {
    @State private var isShowingCamera = false
    @State private var image: UIImage?
    @State private var recognizedObject: String = "No object recognized"
    @State private var correctedObject: String = ""
    @State private var isEditingObjectName = false
    @State private var translation: String = "Translation will appear here"
    @State private var dismissCover = false
    @State private var coverClosedFinish = false
    
    private let database = ObjectNameDatabase()
    
    var body: some View {
        if !dismissCover {
            ZStack {
                VStack {
                    VStack {
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .padding([.leading, .trailing], 15)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            Text("I think is: \(recognizedObject)")
                                .font(.title2)
                                .padding()
                            Text("Translation: \(translation)")
                                .font(.subheadline)
                                .padding()
                        } else {
                            Text("Just add or catch photo")
                                .font(.title)
                                .shadow(radius: 5)
                                .padding(.top, 100)
                        }
                    }
                    Spacer()
                    VStack {
                        Button("Save Correction") {
                            saveCorrectedName()
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        TextField("Enter correct name", text: $correctedObject)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding([.leading, .trailing], 25)
                    }
                    .opacity(coverClosedFinish ? 1 : 0)
                    HStack {
                        Button(action: {
                            isShowingCamera = true
                        }) {
                            HStack {
                                Text("Open Camera")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .padding()
                            }
                            .background(Color.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            isShowingCamera = true
                        }) {
                            HStack {
                                Image(systemName: "photo.badge.arrow.down.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 45, height: 40, alignment: .center)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .shadow(radius: 5)
                        }
                        .frame(width: 100, height: 60)
                    }
                }
                .fullScreenCover(isPresented: $isShowingCamera, onDismiss: {
                    dismissCover = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        dismissCover = false
                        coverClosedFinish = true
                    }
                }) {
                    CameraView(image: $image, recognizedObject: $recognizedObject, translation: $translation, database: database)
                }
            }
        } else {
            ZStack {
                LoadingView()
            }
        }
    }
    
    private func saveCorrectedName() {
        database.saveCorrectedName(for: recognizedObject, correctedName: correctedObject)
        recognizedObject = correctedObject
        correctedObject = ""
        isEditingObjectName = false
    }
}
