//
//  HomeView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 22.02.2024.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("isQuizOneCompleted") var isQuizOneCompleted: Bool = false
    @AppStorage("isQuizTwoCompleted") var isQuizTwoCompleted: Bool = false
    @AppStorage("isQuizThreeCompleted") var isQuizThreeCompleted: Bool = false
    @AppStorage("isQuizFourCompleted") var isQuizFourCompleted: Bool = false
    @AppStorage("isQuizFiveCompleted") var isQuizFiveCompleted: Bool = false
    @AppStorage("isQuizSixCompleted") var isQuizSixCompleted: Bool = false
    @AppStorage("isQuizSevenCompleted") var isQuizSevenCompleted: Bool = false
    @AppStorage("isQuizEightCompleted") var isQuizEightCompleted: Bool = false
    @AppStorage("isQuizNineCompleted") var isQuizNineCompleted: Bool = false
    @AppStorage("isQuizTenCompleted") var isQuizTenCompleted: Bool = false
    @AppStorage("isQuizElevenCompleted") var isQuizElevenCompleted: Bool = false
    @AppStorage("isQuizTwelveCompleted") var isQuizTwelveCompleted: Bool = false
    @AppStorage("isQuizThirteenCompleted") var isQuizThirteenCompleted: Bool = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var timeRemaining: String = ""
    @State var isTimeOut: Bool = false

    @State private var nextUpdateTime: Date = {
        let calendar = Calendar.current
        let endTime = calendar.date(byAdding: .second, value: 15, to: Date()) ?? Date()
        return endTime
    }()

    @EnvironmentObject var storyVM: StoryViewModel
    @EnvironmentObject var homeVM: HomeViewModel

    @State var isStartQuiz: Bool = false
    @State var isShowArchive: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                VStack {
                    StoryRowView()

                    Spacer()

                    VStack {
                        switch homeVM.states {
                        case .empty:
                            EmptyView()

                        case .timer:
                            Text("The next lesson is via:")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.theme.customGray)

                            Text(homeVM.remainTime)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(.white)

                        case .allCompleted:
                            Text("All lessons have been completed. Please check the archive.")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.theme.customGray)
                                .multilineTextAlignment(.center)
                        }
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
            .fullScreenCover(isPresented: $isStartQuiz) {
                if isQuizTwelveCompleted {
                    ThirteenthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizElevenCompleted {
                    TwelfthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizTenCompleted {
                    EleventhInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizNineCompleted {
                    TenthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizEightCompleted {
                    NinthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizSevenCompleted {
                    EighthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizSixCompleted {
                    SeventhInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizFiveCompleted {
                    SixthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizFourCompleted {
                    FifthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizThreeCompleted {
                    FourthInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizTwoCompleted {
                    ThirdInfoQuizView(isStartQuiz: $isStartQuiz)
                } else if isQuizOneCompleted {
                    SecondInfoQuizView(isStartQuiz: $isStartQuiz)
                } else {
                    FirstInfoQuizView(isStartQuiz: $isStartQuiz)
                }
            }

            .fullScreenCover(isPresented: $isShowArchive) {
                ArchiveLessonsView(showArchive: $isShowArchive)
            }
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

        let remaining = calendar.dateComponents([.minute, .second], from: currentTime, to: nextUpdateTime)
        if let minute = remaining.minute, let second = remaining.second {
            if minute <= 0 && second <= 0 {
                stopTimer()
            } else {
                timeRemaining = String(format: "%02d:%02d", max(0, minute), max(0, second))
            }
        }
    }

    func stopTimer() {
        isTimeOut = true
        timer.upstream.connect().cancel()
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
                isStartQuiz.toggle()
            } label: {
                Text("Start")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.customPurple)
                    .cornerRadius(12)
                    .opacity(!homeVM.startEnable ? 0.5 : 1)
                    .animation(nil, value: UUID())
            }
            .disabled(!homeVM.startEnable)

            Button {
                isShowArchive.toggle()
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
        .environmentObject(QuizArchiveViewModel())
        .environmentObject(HomeViewModel())
}
