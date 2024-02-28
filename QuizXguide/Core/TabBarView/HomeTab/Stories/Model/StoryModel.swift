//
//  StoryModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 26.02.2024.
//

import Foundation

struct StoryBundle: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var circleImage: String
    var isSeen: Bool = false
    var stories: [Story]
}

struct Story: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var imageURL: String
    var title: String
    var shortDescription: String
    var fullDescription: String
}
