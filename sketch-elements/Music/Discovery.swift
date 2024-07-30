//
//  Discovery.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 30/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct Discovery: View {
    var albums: [Album]
    var playlist1: Playlist
    var playlist2: Playlist
    init(albums: [Album]) {
        self.playlist1 = Playlist(id: "playlist-1",title: "Little Victories", description: "A beautiful playlist", Albums: Array(albums[0...8]))
        self.playlist2 = Playlist(id: "playlist-2", title: "Today's hits", description: "Today's hottest songs", Albums: Array(albums[6...11]))
        self.albums = albums
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(
                    destination: PlaylistDetail(playlist1)
                    
                ) {
                    PlaylistCard(playlist1)
                }
                NavigationLink(
                    destination: PlaylistDetail(playlist2)
                ) {
                    PlaylistCard(playlist2)
                }
            }
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.musicPrimary.uiColor())
            .navigationBarTitle(Text("Discovery"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
        }
    }
}

struct Discovery_Previews: PreviewProvider {
    static var previews: some View {
        Discovery(albums: musicData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
