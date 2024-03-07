//
//  CustomAlertView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 04.03.2024.
//

import SwiftUI

struct CustomAlertView: View {

    @Binding var isShowAlert: Bool

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()

            VStack {
                Text("You really want to out?")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

                HStack(spacing: 16) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Yes")
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .background(Color.theme.yesButton)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Button {
                        self.isShowAlert = false
                    } label: {
                        Text("Stay")
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .background(Color.theme.customPurple)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding()
            }
            .frame(height: 180)
            .background(Color.theme.backgroundComponents)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
        }
    }
}

#Preview {
    CustomAlertView(isShowAlert: .constant(false))
}
