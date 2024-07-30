//
//  Timeline.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Timeline: View {
    var stories: [Story]
    var users: [User]
    var posts: [Post]
    @State var isPresented = false
    @EnvironmentObject var modalManager: ModalManager
    @State var selectedStory: Story? = nil
    @Environment(\.fullScreenModalState) var modalState: FullScreenModalState

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            Profile(image: nil, add: true).onTapGesture {
                                self.modalManager.openModal(position: .partiallyRevealed)
                            }
                            ForEach(stories) { story in
                                Profile(image: users.first(where: { $0.id == story.user })!.picture.uri, disabled: story.seen, notification: !story.seen).onTapGesture {
                                    modalState.displayContent.send(
                                        StoryView(story: story).anyView
                                    )
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                    .frame(height: 80)
                    .background(Constant.color.bgDefault)
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(posts) { post in
                            SocialCard(
                                user: users.first(where: { $0.id == post.user })!,
                                contentText: post.caption,
                                timestamp: post.timestamp,
                                contentImage: post.picture,
                                commentPictures: post.comments.map { (comment: String) -> Picture in
                                    users.first { (user: User) -> Bool in
                                        user.id == comment
                                    }!.picture
                                }
                            )
                        }
                    }
                }
                .background(Constant.color.gray)
                .navigationBarColor(Constant.color.socialPrimary.uiColor())
                .navigationBarTitle(Text("Timeline"), displayMode: .large)
                .navigationBarItems(trailing: Image(systemName: Constant.icon.compose).foregroundColor(.white).onTapGesture(perform: { self.modalManager.openModal(position: .partiallyRevealed)
                }))
            }
            ModalAnchorView().onAppear {
                self.modalManager.newModal(position: .closed) {
                    NewPost()
                }
            }
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline(stories: storiesData, users: usersData, posts: postsData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .dark)
            .environmentObject(ModalManager())
    }
}
