//
//  StoryView.swift
//  sketch-elements
//
//  Created by Filip Krayem on 29.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct StoryView: View {
    var story: Story
    var user: User
    @Environment(\.fullScreenModalState) var modalState: FullScreenModalState
    @EnvironmentObject var modalManager: ModalManager
    init(story: Story) {
        self.story = story
        self.user = usersData.first(where: { $0.id == story.user })!
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: Constant.icon.close)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                    .onTapGesture {
                        modalState.close.send()
                    }
                Profile(size: 40, image: user.picture.uri)
                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .fontWeight(.bold)
                    Text("@\(user.id)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .opacity(0.6)

                    Text("here").onTapGesture {
                        self.modalManager.openModal(position: .partiallyRevealed)
                    }
                }
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 30)
            .foregroundColor(.white)
            Spacer()
        }.background(
            WebImage(url: story.picture.uri)
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        ).edgesIgnoringSafeArea(.all)
        
        ModalAnchorView().onAppear {
            self.modalManager.newModal(position: .closed) {
                StoryComments()
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: storiesData[1])
    }
}
