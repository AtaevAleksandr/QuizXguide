//
//  StoryDetailView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 26.02.2024.
//

import SwiftUI

struct StoryDetailView: View {

    @EnvironmentObject var storyData: StoryViewModel
    @State private var timerProgress: CGFloat = 0

    var body: some View {
        if storyData.showStory {
            NavigationView {
                TabView(selection: $storyData.currentStory) {
                    ForEach($storyData.currentRandomStories) { $bundle in
                        StoryCardView(bundle: $bundle)
                            .environmentObject(storyData)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.theme.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    title
                    dismissButton
                }
            }
            .transition(.move(edge: .bottom))
            .navigationViewStyle(.stack)
        }
    }
}

struct StoryCardView: View {

    @Binding var bundle: StoryBundle

    @EnvironmentObject var storyData: StoryViewModel

    @State private var isShowFull: Bool = false
    @State private var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State private var timerProgress: CGFloat = 0

    var body: some View {
        GeometryReader { proxy in
            VStack {
                let index = min(Int(timerProgress), bundle.stories.count - 1)
                let story = bundle.stories[index]

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        Image(story.imageURL)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        Text(story.title)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white)

                        Text(isShowFull ? story.fullDescription : story.shortDescription)
                            .font(.system(size: 16))
                            .foregroundStyle(Color.theme.textGray)
                    }
                }

                Spacer()
                bottomButton
            }
            .padding(.top)
            .rotation3DEffect(
                getAngle(proxy: proxy),
                axis: (x: 0.0, y: 1.0, z: 0.0),
                anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing,
                perspective: 2.5
            )
            .overlay (
                HStack(spacing: 5) {
                    ForEach(bundle.stories.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            let width = geometry.size.width
                            let progress = timerProgress - CGFloat(index)
                            let perfectProgress = min(max(progress, 0), 1)

                            Capsule()
                                .fill(.gray.opacity(0.5))
                                .overlay (
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: width * perfectProgress)
                                    , alignment: .leading
                                )
                        }
                    }
                }
                    .frame(height: 1.4)
                , alignment: .top
            )
            .padding()
            .onAppear {
                timerProgress = 0
            }
            .onReceive(timer) { _ in
                if storyData.currentStory == bundle.id {
                    if !bundle.isSeen {
                        bundle.isSeen = true
                        UserDefaults.standard.setStorySeen(bundle.id, true)
                    }

                    if timerProgress < CGFloat(bundle.stories.count) {
                        withAnimation {
                            timerProgress += 0.02
                        }
                    } else {
                        updateStory()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }

    //MARK: COMPONENTS
    private var bottomButton: some View {
        Button {
            isShowFull.toggle()
        } label: {
            Text(isShowFull ? "Back" : "See more")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color.theme.customGray)
                .cornerRadius(12)
                .animation(nil, value: UUID())
        }
    }

    //MARK: FUNCTIONS
    func getAngle(proxy: GeometryProxy) -> Angle {
        let progress = proxy.frame(in: .global).minX / proxy.size.width
        let rotationAngle: CGFloat = 45
        let degrees = rotationAngle * progress
        return Angle(degrees: Double(degrees))
    }

    func updateStory(forward: Bool = true) {
        let index = min(Int(timerProgress), bundle.stories.count - 1)
        let story = bundle.stories[index]

        if let last = bundle.stories.last, last.id == story.id {
            if let lastBundle = storyData.currentRandomStories.last, lastBundle.id == bundle.id {
                withAnimation {
                    storyData.showStory = false
                }
                timerProgress = 0
            } else {
                let bundleIndex = storyData.currentRandomStories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0

                withAnimation {
                    storyData.currentStory = storyData.currentRandomStories[bundleIndex + 1].id
                }
            }
        }
    }
}

//MARK: EXTENSION
extension StoryDetailView {
    private var title: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Stories")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
        }
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                withAnimation {
                    self.storyData.showStory = false
                }
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
    ZStack {
        AppBackgroundView()
        HomeView()
            .environmentObject(StoryViewModel())
    }
}
