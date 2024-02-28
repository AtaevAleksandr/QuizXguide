//
//  StoryView.swift
//  QuizXguide
//
//  Created by Aleksandr Ataev on 26.02.2024.
//

import SwiftUI

struct StoryView: View {

    @EnvironmentObject var storyVM: StoryViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($storyVM.currentRandomStories) { $bundle in
                    ProfileView(bundle: $bundle)
                        .environmentObject(storyVM)
                }
            }
        }
    }
}

struct ProfileView: View {

    @Binding var bundle: StoryBundle
    @EnvironmentObject var storyData: StoryViewModel

    var body: some View {
        Image(bundle.circleImage)
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .padding(4)
            .background(
                Circle()
                    .strokeBorder(Color.theme.customPurple, lineWidth: 4)
                    .opacity(bundle.isSeen ? 0 : 1)
            )
            .onTapGesture {
                withAnimation {
                    UserDefaults.standard.setStorySeen(bundle.id, true)
                    bundle.isSeen = true
                    storyData.currentStory = bundle.id
                    storyData.showStory = true
                }
            }
    }
}

extension UserDefaults {
    func isStorySeen(_ storyID: String) -> Bool {
        return bool(forKey: storyID)
    }

    func setStorySeen(_ storyID: String, _ value: Bool) {
        set(value, forKey: storyID)
    }
}


#Preview {
    ZStack {
        AppBackgroundView()
        StoryView()
            .environmentObject(StoryViewModel())
    }
}
