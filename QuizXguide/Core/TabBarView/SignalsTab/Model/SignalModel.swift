//
//  SignalModel.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 23.02.2024.
//

import Foundation
import SwiftUI

enum Status: Codable, CaseIterable {
    case greenArrow
    case redArrow

    var arrowName: String {
        switch self {
        case .greenArrow:
            return "arrow.up.circle"
        case .redArrow:
            return "arrow.down.circle"
        }
    }

    var displayText: String {
        switch self {
        case .greenArrow:
            return "Buy"
        case .redArrow:
            return "Sell"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .greenArrow:
            return Color.theme.customGreen
        case .redArrow:
            return Color.theme.customRed
        }
    }

    static func randomStatus() -> Status {
        let allCases = self.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}

struct SignalModel: Identifiable {
    var id = UUID()
    var iconImage: String
    var name: String
    var arrowStatus: Status
    var currentTime: String

    static func getCurrentTime() -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: Date())
        }

    static var signals: [SignalModel] = [
        SignalModel(iconImage: "AUD:CAD",
                    name: "AUD/CAD", 
                    arrowStatus: .randomStatus(), 
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "AUD:CHF",
                    name: "AUD/CHF", 
                    arrowStatus: .randomStatus(), 
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "AUD:JPY",
                    name: "AUD/JPY",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "AUD:USD",
                    name: "AUD/USD",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "CAD:CHF",
                    name: "CAD/CHF", 
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "CAD:JPY",
                    name: "CAD/JPY", 
                    arrowStatus: .randomStatus(), 
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "EUR:CAD",
                    name: "EUR/CAD",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "EUR:CHF",
                    name: "EUR/CHF", 
                    arrowStatus: .randomStatus(), 
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "EUR:GBP",
                    name: "EUR/GBP", 
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "EUR:JPY",
                    name: "EUR/JPY",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "EUR:USD",
                    name: "EUR/USD",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "GBP:AUD",
                    name: "GBP/AUD",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "GBP:CHF",
                    name: "GBP/CHF", 
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "GBP:JPY",
                    name: "GBP/JPY",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "GBP:USD",
                    name: "GBP/USD", 
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "USD:CAD",
                    name: "USD/CAD",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "USD:CHF",
                    name: "USD/CHF",
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime()),
        SignalModel(iconImage: "USD:JPY",
                    name: "USD/JPY", 
                    arrowStatus: .randomStatus(),
                    currentTime: getCurrentTime())
    ]
}
