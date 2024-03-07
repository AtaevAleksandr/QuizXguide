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
            .onAppear {
                if isQuizThirteenCompleted {
                    homeVM.states = .allCompleted
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { title }
            .fullScreenCover(isPresented: $isStartQuiz) {
                if isQuizTwelveCompleted {
                    ThirteenthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizElevenCompleted {
                    TwelfthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizTenCompleted {
                    EleventhInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizNineCompleted {
                    TenthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizEightCompleted {
                    NinthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizSevenCompleted {
                    EighthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizSixCompleted {
                    SeventhInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizFiveCompleted {
                    SixthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizFourCompleted {
                    FifthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizThreeCompleted {
                    FourthInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizTwoCompleted {
                    ThirdInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else if isQuizOneCompleted {
                    SecondInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
                } else {
                    FirstInfoQuizView(isStartQuiz: $isStartQuiz, openedFromArchive: .constant(false))
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
                    .opacity(!homeVM.startEnable || isQuizThirteenCompleted ? 0.5 : 1)
                    .animation(nil, value: UUID())
            }
            .disabled(!homeVM.startEnable || isQuizThirteenCompleted)

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
        .environmentObject(HomeViewModel())
}
