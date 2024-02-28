//
//  Color.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import Foundation
import SwiftUI

extension Color {

    static let theme = ColorTheme()
}

struct ColorTheme {
    let background: Color = Color("BackgroundColor")
    let customPurple: Color = Color("CustomPurpleColor")
    let backgroundComponents: Color = Color("BackgroundComponents")
    let customGray: Color = Color("CustomGrayColor")
    let backgroundWeb: Color = Color("BackgroundWeb")
    let customGreen: Color = Color("CustomGreenColor")
    let customRed: Color = Color("CustomRedColor")
    let textGray: Color = Color("TextGrayColor")
}
