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
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack(spacing: 16) {
                        Profile(image: nil, add: true)
                        ForEach(stories) { story in
                            Profile(image: users.first(where: { $0.id == story.user })!.picture.uri, disabled: story.seen, notification: !story.seen)
                        }
                    }
                    .padding([.leading, .trailing])
                }
                .frame(height: 80)
                .background(Constant.color.bgDefault)
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(posts) { post in
                        //NavigationLink(
                        //    destination: RecipesListView(category: category)
                        //) {
                        CardSocial(
                            user: users.first(where: { $0.id == post.user })!,
                            contentText: post.caption,
                            timestamp: post.timestamp,
                            contentImage: post.picture,
                            commentPictures: post.comments.map({ (comment: String) -> Picture in
                                return users.first { (user: User) -> Bool in
                                    return user.id == comment
                                }!.picture
                            })
                        )
                    }
                }
            }.background(Constant.color.gray)
            .navigationBarColor(UIColor(named: "SocialPrimary"))
            .navigationBarTitle(Text("Timeline"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.compose).foregroundColor(.white))
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline(stories: storiesData, users: usersData, posts: postsData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
