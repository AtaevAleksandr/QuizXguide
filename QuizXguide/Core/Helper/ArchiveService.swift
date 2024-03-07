//
//  ArchiveService.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 07.03.2024.
//

import Foundation

final class ArchiveSevice {
    private let quizzesArchiveKey = "quizzesArchive"

    private var quizzes: [QuizModel] {
        get {
            if let data = UserDefaults.standard.data(forKey: quizzesArchiveKey) {
                if let decodedQuizzes = try? JSONDecoder().decode([QuizModel].self, from: data) {
                    return decodedQuizzes
                }
            }
            return []
        }

        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encodedData, forKey: quizzesArchiveKey)
            }
        }
    }

    public func insertQuiz(_ quiz: QuizModel) {
        if !quizzes.contains(where: { $0.id == quiz.id }) {
            quizzes.append(quiz)
        }
    }

    public func fetchQuiz() -> [QuizModel] {
        return quizzes
    }
}
