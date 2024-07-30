//
//  Artist Detail.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 26/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct MusicAccount: View {
    
    //var conversations: [Conversation]
    //var posts: [Post]
    var user: User
    //var users: [User]
    @State var selectedType = 0
    var menuItems: [String] = ["Playlists", "Albums"]
    var playlists: [Playlist]
    
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
                    //ForEach(posts) { post in
                        //NavigationLink(
                        //    destination: RecipesListView(category: category)
                        //) {
                        
                        //--->TODO CardPlaylist(title: "Little Victories", subTitle: <#T##String?#>, height: 200, pictureUrl: <#T##URL#>, description: <#T##String?#>)
                        
                        
                        //CardMusic(title: "TODOLittle Victories", subTitle: "", height: <#T##CGFloat#>, pictureUrl: <#T##URL#>, description: <#T##String?#>)
                        /*
                        CardSocial(
                            user: user,
                            contentText: post.caption,
                            timestamp: post.timestamp,
                            contentImage: post.picture,
                            commentPictures: post.comments.map({ (comment: String) -> Picture in
                                return users.first { (user: User) -> Bool in
                                    return user.id == comment
                                }!.picture
                            })
                        )*/
                        
                    //}
                    
                    //TODO Playlisty
                    CardPlaylist(title: "Little Victories", height: 400, pictureUrl: playlists[0].picture.uri, description: "Jedna deska, Dve desky", albums: playlists)
                    CardPlaylist(title: "Today's Hits", height: 400, pictureUrl: playlists[1].picture.uri, description: "Lords, Shakira, Lady Gaga", albums: playlists)
                }
            }.background(Constant.color.gray)
            .edgesIgnoringSafeArea([.top])
            .navigationBarTitle("", displayMode: .large)
            .navigationBarItems(leading: Image(systemName: Constant.icon.share).foregroundColor(.white).rotationEffect(.degrees(90)), trailing: Text("Edit").foregroundColor(.white))
        }
    }
}

struct MusicAccount_Previews: PreviewProvider {
    static var previews: some View {
        //ArtistDetail(conversations: conversationsData, posts: postsData, user: usersData[6], users: usersData, playlists: albumData)
        MusicAccount(user: usersData[9], playlists: playlistData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}


