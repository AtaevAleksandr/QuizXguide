//
//  QuizViewModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 02.03.2024.
//

import Foundation

final class QuizViewModel: ObservableObject {

    @Published var allQuizzes: [InfoQuizModel] = InfoQuizModel.infoQuizzes
}
