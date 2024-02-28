//
//  WelcomeView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)

            Text("Our application will introduce you to the market, suitable for both beginners and experienced traders")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 40)

            Spacer()

            Image(.chart)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
                .background(
                    Ellipse()
                        .foregroundStyle(Color.theme.customPurple)
                        .frame(width: 300, height: 250)
                        .opacity(0.6)
                        .blur(radius: 65)
                )

            Spacer()

            Text("Let's introduce you to the functionality, you will like it!")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)

            Spacer()
            Spacer()
        }
        .padding()
        .clipped()
    }
}

#Preview {
    ZStack {
        OnboardingBackgroundView().ignoresSafeArea()
        WelcomeView()
    }

}
