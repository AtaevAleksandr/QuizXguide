//
//  DemoStoriesView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct DemoStoriesView: View {
    var body: some View {
        VStack {
            Text("Watch stories every day!")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)

            Text("Stories will help you keep up to date with all market events")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)

            ZStack {
                blurEllipse
                phone
                    .overlay(backgroundPhone, alignment: .bottom)
            }
        }
        .clipped()
    }
}

//MARK: COMPONENTS
extension DemoStoriesView {
    private var blurEllipse: some View {
        Image(.blur)
            .resizable()
            .offset(y: -80)
    }

    private var phone: some View {
        Image(.demoStories)
            .resizable()
            .scaledToFit()
            .padding(.top, 20)
            .padding(.horizontal, 50)
    }

    private var backgroundPhone: some View {
        Image(.backgroundPhone)
            .resizable()
            .scaledToFit()
            .offset(y: 100)
    }
}

#Preview {
    ZStack {
        OnboardingBackgroundView().ignoresSafeArea()
        DemoStoriesView()
    }
}
