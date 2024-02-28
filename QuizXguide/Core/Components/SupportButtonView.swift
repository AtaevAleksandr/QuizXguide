//
//  SupportButtonView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct SupportButtonView: View {

    @State var title: String
    @State var iconImage: String

    var body: some View {
        Button {

        } label: {
            HStack() {
                Image(iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text(LocalizedStringKey(title))
                    .font(.system(size: 16, weight: .semibold))

                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .foregroundStyle(.white)
        .background(Color.theme.backgroundComponents)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStack {
        AppBackgroundView()
        SupportButtonView(title: "Support", iconImage: "Support")
    }
}
