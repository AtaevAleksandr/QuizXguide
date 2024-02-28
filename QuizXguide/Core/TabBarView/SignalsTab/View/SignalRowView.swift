//
//  SignalRowView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 23.02.2024.
//

import SwiftUI

struct SignalRowView: View {

    let signal: SignalModel

    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()

    var body: some View {
        HStack {
            Image(signal.iconImage)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)

            Text(signal.name)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)

            Spacer()

            Text(signal.currentTime)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)

            Spacer()

            Image(systemName: signal.arrowStatus.arrowName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(signal.arrowStatus.backgroundColor)

            Text(LocalizedStringKey(signal.arrowStatus.displayText))
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(signal.arrowStatus.backgroundColor)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color.theme.backgroundComponents)
        .cornerRadius(10)
    }
}

//#Preview {
//
//    ZStack {
//        var signal: SignalModel
//
//        AppBackgroundView()
//        SignalModel(iconImage: signal.iconImage, name: signal.name, arrowStatus: signal.arrowStatus, currentTime: signal.currentTime)
//    }
//}
