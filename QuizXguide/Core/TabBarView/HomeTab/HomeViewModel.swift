//
//  HomeViewModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 07.03.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    enum ViewStates {
        case empty
        case timer
        case allCompleted
    }

    @Published var states: ViewStates = .empty
    @Published var remainTime: String = ""
    @Published var startEnable: Bool = true

    private var nextUpdateTime: Date = Date()

    private func createTimer() {
        let calendar = Calendar.current
        nextUpdateTime = calendar.date(byAdding: .second, value: 17, to: Date()) ?? Date()

        let timer = Timer(timeInterval: 1, repeats: true) { timer in
            self.remainTime = self.updateTimeRemaining()
            if self.remainTime == "00:00" {
                timer.invalidate()
                self.goToEmpty()
            }
        }

        RunLoop.main.add(timer, forMode: .common)
    }

   private func updateTimeRemaining() -> String {
        let currentTime = Date()
        let calendar = Calendar.current

        let remaining = calendar.dateComponents([.minute, .second], from: currentTime, to: nextUpdateTime)
        if let minute = remaining.minute, let second = remaining.second {
            return String(format: "%02d:%02d", max(0, minute), max(0, second))
        }

       return ""
    }

    func goToTimer() {
        createTimer()
        states = .timer
        startEnable = false
    }

    func goToEmpty() {
        states = .empty
        startEnable = true
    }
}
