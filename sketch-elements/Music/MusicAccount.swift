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
    var user: User
    @State var selectedType = 0
    var menuItems = ["Playlists", "Albums"]
    var playlists: [Playlist]
    init(user: User) {
        self.user = user
        let playlist1 = Playlist(id: "playlist-1", title: "Little Victories", description: "A beautiful playlist", Albums: Array(musicData[0...8]))
        let playlist2 = Playlist(id: "playlist-2", title: "Today's hits", description: "Today's hottest songs", Albums: Array(musicData[6...11]))
        self.playlists = [playlist1, playlist2]
    }

    var body: some View {
        NavigationView {
            VStack {
                Header(image: user.cover!.uri, height: 320) {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
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
                    ForEach(playlists, id: \.id) { playlist in
                        NavigationLink(destination: PlaylistDetail(playlist)) {
                            PlaylistCard(playlist)
                        }
                    }
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
        MusicAccount(user: usersData[9])
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
