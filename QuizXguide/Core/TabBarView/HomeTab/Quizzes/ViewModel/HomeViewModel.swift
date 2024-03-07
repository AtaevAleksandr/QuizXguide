//
//  HomeViewModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 07.03.2024.
//

import Foundation
import UIKit

final class HomeViewModel: ObservableObject {
    private var archiveService = ArchiveSevice()

    enum ViewStates {
        case empty
        case timer
        case allCompleted
    }

    @Published var states: ViewStates = .empty
    @Published var remainTime: String = ""
    @Published var startEnable: Bool = true
    @Published var quizModel: [QuizModel] = []

    private var nextUpdateTime: Date = Date()

    let notificationCenter = NotificationCenter.default

    init() {
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func appMovedToBackground() {
        UserDefaults.standard.setValue(nextUpdateTime, forKey: "Update")
    }

    @objc func appMovedToForeground() {
        if let data = UserDefaults.standard.value(forKey: "Update") as? Date {
            if data >= Date.now {
                nextUpdateTime = data
                goToTimerFromBack()
            } else {
                goToEmpty()
            }
        } else {
            goToEmpty()
        }
    }

    func createTimerFromBackground() {
        let timer = Timer(timeInterval: 1, repeats: true) { timer in
            self.remainTime = self.updateTimeRemaining()
            if self.remainTime == "00:00" {
                timer.invalidate()
                self.goToEmpty()
            }
        }

        RunLoop.main.add(timer, forMode: .common)
    }

    private func createTimer() {
        let calendar = Calendar.current
        nextUpdateTime = calendar.date(byAdding: .second, value: 900, to: Date()) ?? Date()

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

    func goToTimerFromBack() {
        createTimerFromBackground()
        states = .timer
        startEnable = false
    }

    func goToEmpty() {
        states = .empty
        startEnable = true
    }

    func goToAllCompleted() {
        states = .allCompleted
        startEnable = false
    }

    public func append(_ model: QuizModel) {
        archiveService.insertQuiz(model)
        quizModel = archiveService.fetchQuiz()
    }

    func fillView() {
        quizModel = archiveService.fetchQuiz()
    }
}
