//
//  SettingsView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                VStack(spacing: 12) {
                    PrivacyButtonView(title: "Privacy Policy", iconImage: "Privacy")
                    SupportButtonView(title: "Support", iconImage: "Support")

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { title }
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: EXTENSION
extension SettingsView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Settings")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    SettingsView()
}
