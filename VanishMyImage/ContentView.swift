//
//  ContentView.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 20.10.24.
//

import SwiftUI
import SnapKit
import Lottie
import Vision

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                CustomTabBar()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

