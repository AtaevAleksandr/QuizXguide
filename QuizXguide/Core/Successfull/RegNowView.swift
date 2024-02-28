//
//  RegNowView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct RegNowView: View {

    @Binding var showView: Bool
    
    var body: some View {
        ZStack {
            OnboardingBackgroundView().ignoresSafeArea()

            VStack {
                HStack {
                    Text("Already ")
                    +
                    Text("522 815 ")
                        .foregroundColor(Color.theme.customPurple)
                    +
                    Text("users have registered and are earning right now")
                }
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .padding()

                Image("RegNow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 402)
                    .padding(.top, 30)

                Spacer()
                bottomButton
            }
        }
    }
}

//MARK: COMPONENTS
extension RegNowView {
    private var bottomButton: some View {
        Button {
            showView.toggle()
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
    RegNowView(showView: .constant(false))
}
