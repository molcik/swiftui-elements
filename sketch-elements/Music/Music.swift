//
//  Music.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 28/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Music: View {
    
    var albums:[Playlist] = playlistData
    var cities:[City] = citiesData
    
    var body: some View {
        TabView() {
            
            Library(playlists: albums).tabItem {
                Text("Albums")
                Image(systemName: "music.note")
            }
            Discovery(albums: albums).tabItem {
                Text("Discovery")
                Image(systemName: Constant.icon.doc)
            }
            MusicAccount(user: usersData[9], playlists: playlistData).tabItem {  
                Text("Account")
                Image(systemName: "person.fill")
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.musicPrimary)
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music().environmentObject(UserData())
    }
}
