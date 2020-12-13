//
//  Social.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Social: View {
    
    var stories:[Story] = storiesData
    var users:[User] = usersData
    var posts:[Post] = postsData
    var conversations:[Conversation] = conversationsData

    
    var body: some View {
        TabView() {
            Timeline(stories: stories, users: users, posts: posts).tabItem {
                Text("Timeline")
                Image(systemName: Constant.icon.doc)
            }
            Messages(conversations: conversations, users: users).tabItem {
                Text("Messages")
                Image(systemName: Constant.icon.envelope)
            }
            Account(conversations: conversations, posts: posts.filter({ (post: Post) -> Bool in
                return post.user == users[6].id
            }), user: users[6], users: users).tabItem {
                Text("Account")
                Image(systemName: Constant.icon.person)
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.socialPrimary)
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        Social().environmentObject(UserData())
    }
}


