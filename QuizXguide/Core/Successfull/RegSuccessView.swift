//
//  RegSuccessView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct RegSuccessView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            OnboardingBackgroundView().ignoresSafeArea()

            VStack {
                Spacer()

                Image(.regComplete)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 111, height: 111)

                Text("Registration completed")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 26)
                    .padding(.horizontal)

                Spacer()
                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension RegSuccessView {
    private var bottomButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Next")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(height: 53)
                .frame(maxWidth: .infinity)
                .background(Color.theme.customPurple)
                .cornerRadius(12)
                .animation(nil, value: UUID())
                .padding()
        }
    }
}

#Preview {
    RegSuccessView()
}
