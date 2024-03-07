//
//  QuizArchiveViewModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 04.03.2024.
//

import Foundation

final class QuizArchiveViewModel: ObservableObject {
    private let quizzesArchiveKey = "quizzesArchive"

    @Published var quizzesArchive: [QuizModel] = [] {
        didSet {
            saveQuizzesArchive()
        }
    }

    init() {
        loadQuizzesArchive()
    }

    private func loadQuizzesArchive() {
        if let data = UserDefaults.standard.data(forKey: quizzesArchiveKey) {
            if let decodedQuizzes = try? JSONDecoder().decode([QuizModel].self, from: data) {
                quizzesArchive = decodedQuizzes
            }
        }
    }
    
    private func saveQuizzesArchive() {
        if let encodedData = try? JSONEncoder().encode(quizzesArchive) {
            UserDefaults.standard.set(encodedData, forKey: quizzesArchiveKey)
        }
    }
}
