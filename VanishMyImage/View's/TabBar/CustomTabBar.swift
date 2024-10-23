//
//  CustomTabBar.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 23.10.24.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            Spacer()
            TabContentView(selectedTab: selectedTab)
                .padding(.bottom)
            TabsLayoutView(selectedTab: $selectedTab)
                .padding()
                .background(
                    Capsule()
                        .fill(Color.white)
                )
                .frame(height: 70)
                .shadow(radius: 30)
                .padding(.bottom, 40)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

fileprivate struct TabsLayoutView: View {
    @Binding var selectedTab: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
            }
        }
    }
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        @State private var selectedOffset: CGFloat = 0
        @State private var rotationAngle: CGFloat = 0
        
        var body: some View {
            Button {
                withAnimation(.easeInOut) {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
                        Capsule()
                            .fill(tab.color.opacity(0.2))
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                    }
                    HStack(spacing: 10) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(isSelected ? tab.color : .black.opacity(0.6))
                        
                        if isSelected {
                            Text(tab.title)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(tab.color)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .buttonStyle(.plain)
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, game, apps
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "camera.metering.unknown"
        case .game:
            return "camera.metering.none"
        case .apps:
            return "gear"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Object"
        case .game:
            return "Text"
        case .apps:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .game:
            return .pink
        case .apps:
            return .orange
        }
    }
}

struct TabContentView: View {
    var selectedTab: Tab
    
    var body: some View {
        switch selectedTab {
        case .home:
            MainViewController()
        case .game:
            EmptyView()
        case .apps:
            MainViewController()
        }
    }
}
