//
//  HomeView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct HomeView: View {

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var timeRemaining: String = ""

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endTime = calendar.date(byAdding: .second, value: 900, to: Date()) ?? Date()
        return endTime
    }()

    @EnvironmentObject var storyVM: StoryViewModel

    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                VStack {
                    StoryRowView()

                    Spacer()
                    
                    VStack {
                        Text("The next lesson is via:")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.theme.customGray)

                        Text("\(timeRemaining)")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.white)
                    }

                    Spacer()
                    bottomButtons
                }
                .padding()
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
        .overlay {
            StoryDetailView()
                .environmentObject(storyVM)
        }
    }

    //MARK: FUNCTIONS
    func updateTimeRemaining() {
        let currentTime = Date()
        let calendar = Calendar.current

        if currentTime >= nextUpdateTime {
            nextUpdateTime = calendar.date(byAdding: .second, value: 900, to: Date()) ?? Date()
        }

        let remaining = calendar.dateComponents([.minute, .second], from: currentTime, to: nextUpdateTime)
        if let minute = remaining.minute, let second = remaining.second {
            timeRemaining = String(format: "%02d:%02d", minute, second)
        }
    }
}

//MARK: EXTENSION
extension HomeView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Home")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var bottomButtons: some View {
        VStack {
            Button {
                //MARK: TODO
            } label: {
                Text("Start")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.customPurple)
                    .cornerRadius(12)
                    .animation(nil, value: UUID())
            }

            Button {
                //MARK: TODO
            } label: {
                Text("Archive")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.theme.customPurple)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .animation(nil, value: UUID())
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    HomeView()
        .environmentObject(StoryViewModel())
}
