//
//  QuizXguideApp.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

@main
struct QuizXguideApp: App {

    @StateObject private var signalVM = SignalViewModel()
    @StateObject private var storyVM = StoryViewModel()
    @StateObject private var quizVM = QuizArchiveViewModel()
    @StateObject private var homeVM = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            LoadingView()
                .preferredColorScheme(.dark)
                .environmentObject(signalVM)
                .environmentObject(storyVM)
                .environmentObject(quizVM)
                .environmentObject(homeVM)
        }
    }
}
