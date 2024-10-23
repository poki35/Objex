//
//  LottieLoadingAnimations.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 20.10.24.
//

import Foundation
import Lottie
import UIKit
import SwiftUI

struct LottieLoadingAnimationsView: UIViewRepresentable {
    var animationName: String
        var loopMode: LottieLoopMode = .loop
        
        func makeUIView(context: Context) -> some UIView {
            let view = UIView(frame: .zero)
            let animationView = LottieAnimationView(name: animationName)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
            animationView.play()
            
            // Преобразование для исправления ориентации
            animationView.transform = CGAffineTransform(scaleX: 1, y: -1)  // Отражение по оси Y
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            
            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
            
            return view
        }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Обновление UIView при необходимости
    }
}
