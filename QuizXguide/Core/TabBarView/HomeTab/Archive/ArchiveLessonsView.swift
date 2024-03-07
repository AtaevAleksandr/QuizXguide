//
//  ArchiveLessonsView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 04.03.2024.
//

import SwiftUI

struct ArchiveLessonsView: View {

    @AppStorage("isQuizOneCompleted") var isQuizOneCompleted: Bool = false

    @Environment(\.dismiss) var dismiss

    @Binding var showArchive: Bool

    @EnvironmentObject var arhiveViewModel: QuizArchiveViewModel

    @State var showQuizOne: Bool = false
    @State var showQuizTwo: Bool = false
    @State var showQuizThree: Bool = false
    @State var showQuizFour: Bool = false
    @State var showQuizFive: Bool = false
    @State var showQuizSix: Bool = false
    @State var showQuizSeven: Bool = false
    @State var showQuizEight: Bool = false
    @State var showQuizNine: Bool = false
    @State var showQuizTen: Bool = false
    @State var showQuizEleven: Bool = false
    @State var showQuizTwelve: Bool = false
    @State var showQuizThirteen: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                AppBackgroundView()

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(arhiveViewModel.quizzesArchive.indices, id: \.self) { index in

                        let lesson = arhiveViewModel.quizzesArchive[index]

                        HStack(spacing: 30) {
                            Text("\(index + 1)")
                                .font(.system(size: 18, weight: .bold))

                            Button {
                                switch index {
                                case 0:
                                    showQuizOne = true
                                case 1:
                                    showQuizTwo = true
                                case 2:
                                    showQuizThree = true
                                case 3:
                                    showQuizFour = true
                                case 4:
                                    showQuizFive = true
                                case 5:
                                    showQuizSix = true
                                case 6:
                                    showQuizSeven = true
                                case 7:
                                    showQuizEight = true
                                case 8:
                                    showQuizNine = true
                                case 9:
                                    showQuizTen = true
                                case 10:
                                    showQuizEleven = true
                                case 11:
                                    showQuizTwelve = true
                                case 12:
                                    showQuizThirteen = true
                                default:
                                    break
                                }
                            } label: {
                                Text(lesson.title)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 46)
                                    .padding(.horizontal)
                                    .background(Color.theme.yesButton)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        .padding(.vertical, 3)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                title
                dismissButton
            }
            .fullScreenCover(isPresented: $showQuizOne) {
                FirstInfoQuizView(isStartQuiz: $showQuizOne)
            }
            .fullScreenCover(isPresented: $showQuizTwo) {
                SecondInfoQuizView(isStartQuiz: $showQuizTwo)
            }
            .fullScreenCover(isPresented: $showQuizThree) {
                ThirdInfoQuizView(isStartQuiz: $showQuizThree)
            }
            .fullScreenCover(isPresented: $showQuizFour) {
                FourthInfoQuizView(isStartQuiz: $showQuizFour)
            }
            .fullScreenCover(isPresented: $showQuizFive) {
                FifthInfoQuizView(isStartQuiz: $showQuizFive)
            }
            .fullScreenCover(isPresented: $showQuizSix) {
                SixthInfoQuizView(isStartQuiz: $showQuizSix)
            }
            .fullScreenCover(isPresented: $showQuizSeven) {
                SeventhInfoQuizView(isStartQuiz: $showQuizSeven)
            }
            .fullScreenCover(isPresented: $showQuizEight) {
                EighthInfoQuizView(isStartQuiz: $showQuizEight)
            }
            .fullScreenCover(isPresented: $showQuizNine) {
                NinthInfoQuizView(isStartQuiz: $showQuizNine)
            }
            .fullScreenCover(isPresented: $showQuizTen) {
                TenthInfoQuizView(isStartQuiz: $showQuizTen)
            }
            .fullScreenCover(isPresented: $showQuizEleven) {
                EleventhInfoQuizView(isStartQuiz: $showQuizEleven)
            }
            .fullScreenCover(isPresented: $showQuizTwelve) {
                TwelfthInfoQuizView(isStartQuiz: $showQuizTwelve)
            }
            .fullScreenCover(isPresented: $showQuizThirteen) {
                ThirteenthInfoQuizView(isStartQuiz: $showQuizThirteen)
            }
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: EXTENSION
extension ArchiveLessonsView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("Lessons")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ArchiveLessonsView(showArchive: .constant(false))
        .environmentObject(QuizArchiveViewModel())
}
