//
//  Profile.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Account: View {
    
    var conversations: [Conversation]
    var posts: [Post]
    var user: User
    var users: [User]
    @State var selectedType = 0
    var menuItems: [String] = ["Posts", "Comments", "Likes"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                Header(image: user.cover!.uri, height: 320) {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            ZStack{
                                Circle()
                                .foregroundColor(.white)
                                .frame(width: 98, height: 98)
                            Profile(size: 90, image: user.picture.uri)
                            }
                            Spacer()
                        }
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(user.caption)
                            .multilineTextAlignment(.center)
                        
                        SegmentedPickerCollapsed(items: menuItems, selection: $selectedType).padding(.top)
                    }
                }
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(posts) { post in
                        //NavigationLink(
                        //    destination: RecipesListView(category: category)
                        //) {
                        SocialCard(
                            user: user,
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
            .edgesIgnoringSafeArea([.top])
            .navigationBarTitle("", displayMode: .large)
            .navigationBarItems(leading: Image(systemName: Constant.icon.share).foregroundColor(.white).rotationEffect(.degrees(90)), trailing: Text("Edit").foregroundColor(.white))
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(conversations: conversationsData, posts: postsData, user: usersData[6], users: usersData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}

