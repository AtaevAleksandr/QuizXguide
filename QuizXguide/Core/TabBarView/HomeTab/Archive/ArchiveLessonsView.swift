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

    @EnvironmentObject var homeVM: HomeViewModel

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
                    ForEach(homeVM.quizModel, id: \.self) { model in

                        let lesson = homeVM.quizModel.first(where: { $0.id == model.id }) ?? QuizModel(id: 99, title: "Test")

                        HStack {
                            Text("\(model.id)")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 40, alignment: .leading)

                            Spacer()

                            Button {
                                switch model.id {
                                case 1:
                                    showQuizOne = true
                                case 2:
                                    showQuizTwo = true
                                case 3:
                                    showQuizThree = true
                                case 4:
                                    showQuizFour = true
                                case 5:
                                    showQuizFive = true
                                case 6:
                                    showQuizSix = true
                                case 7:
                                    showQuizSeven = true
                                case 8:
                                    showQuizEight = true
                                case 9:
                                    showQuizNine = true
                                case 10:
                                    showQuizTen = true
                                case 11:
                                    showQuizEleven = true
                                case 12:
                                    showQuizTwelve = true
                                case 13:
                                    showQuizThirteen = true
                                default:
                                    break
                                }
                            } label: {
                                Text(lesson.title)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
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
            .onAppear {
                homeVM.fillView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                title
                dismissButton
            }
            .fullScreenCover(isPresented: $showQuizOne) {
                FirstInfoQuizView(isStartQuiz: $showQuizOne, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizTwo) {
                SecondInfoQuizView(isStartQuiz: $showQuizTwo, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizThree) {
                ThirdInfoQuizView(isStartQuiz: $showQuizThree, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizFour) {
                FourthInfoQuizView(isStartQuiz: $showQuizFour, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizFive) {
                FifthInfoQuizView(isStartQuiz: $showQuizFive, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizSix) {
                SixthInfoQuizView(isStartQuiz: $showQuizSix, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizSeven) {
                SeventhInfoQuizView(isStartQuiz: $showQuizSeven, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizEight) {
                EighthInfoQuizView(isStartQuiz: $showQuizEight, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizNine) {
                NinthInfoQuizView(isStartQuiz: $showQuizNine, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizTen) {
                TenthInfoQuizView(isStartQuiz: $showQuizTen, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizEleven) {
                EleventhInfoQuizView(isStartQuiz: $showQuizEleven, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizTwelve) {
                TwelfthInfoQuizView(isStartQuiz: $showQuizTwelve, openedFromArchive: .constant(true))
            }
            .fullScreenCover(isPresented: $showQuizThirteen) {
                ThirteenthInfoQuizView(isStartQuiz: $showQuizThirteen, openedFromArchive: .constant(true))
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

//#Preview {
//    ArchiveLessonsView(showArchive: .constant(false))
//        .environmentObject(QuizArchiveViewModel())
//}
