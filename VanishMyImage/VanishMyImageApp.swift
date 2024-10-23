//
//  VanishMyImageApp.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 20.10.24.
//

import SwiftUI
import DotLottie
import UIKit

@main
struct VanishMyImageApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var showContentView = false

    var body: some Scene {
        WindowGroup {
            if showContentView {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .preferredColorScheme(.light)
            } else {
                AnimationView(showContentView: $showContentView)
                    .preferredColorScheme(.light)
            }
        }
    }
}

struct AnimationView: View {
    @Binding var showContentView: Bool

    var body: some View {
        DotLottieAnimation(fileName: "truckLoading", config: AnimationConfig(autoplay: true, loop: false))
            .view()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    showContentView = true
                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}

struct LoadingView: View {
//    @Binding var dismissCover: Bool

    var body: some View {
        DotLottieAnimation(fileName: "Animation - 1729626544136", config: AnimationConfig(autoplay: true, loop: true))
            .view()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
//                    dismissCover = true
                }
            }
            .edgesIgnoringSafeArea(.all)
            .preferredColorScheme(.light)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}
