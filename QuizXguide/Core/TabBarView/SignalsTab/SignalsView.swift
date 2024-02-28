//
//  SignalsView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct SignalsView: View {

    @EnvironmentObject private var viewModel: SignalViewModel

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var timeRemaining: String = ""

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endTime = calendar.date(byAdding: .second, value: 300, to: Date()) ?? Date()
        return endTime
    }()

    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                GeometryReader { geo in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Text("The next signal is via:")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.theme.customGray)

                            Text("\(timeRemaining)")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .frame(height: geo.size.height / 2)

                        randomSignals
                    }
                }
                .padding(.horizontal)
            }
            .onReceive(timer) { _ in
                withAnimation(.linear(duration: 0.5)) {
                    DispatchQueue.main.async {
                        updateTimeRemaining()
                    }
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 0.5)) {
                    DispatchQueue.main.async {
                        updateTimeRemaining()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { title }
        }
        .navigationViewStyle(.stack)
    }

    //MARK: FUNCTIONS
    func updateTimeRemaining() {
        let currentTime = Date()
        let calendar = Calendar.current

        if currentTime >= nextUpdateTime {
            nextUpdateTime = calendar.date(byAdding: .second, value: 300, to: Date()) ?? Date()
            DispatchQueue.main.async {
                viewModel.generateFiveRandomSignals()
            }
        }

        let remaining = calendar.dateComponents([.minute, .second], from: currentTime, to: nextUpdateTime)
        if let minute = remaining.minute, let second = remaining.second {
            timeRemaining = String(format: "%02d:%02d", minute, second)
        }
    }
}

//MARK: EXTENSION
extension SignalsView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Signals")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var randomSignals: some View {
        ForEach(viewModel.allSignals) { signal in
            SignalRowView(signal: signal)
        }
        .onAppear {
            viewModel.generateFiveRandomSignals()
        }
    }
}

#Preview {
    SignalsView()
        .environmentObject(SignalViewModel())
}
