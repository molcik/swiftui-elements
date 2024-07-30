//
//  DiscoveryDetail.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 08/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

struct PlaylistDetail: View {
    var playlist: Playlist
    var images: [URL]

    init(_ playlist: Playlist) {
        self.playlist = playlist

        images = playlist.Albums[0 ... 3].map { a in
            a.picture.uri
        }
    }

    var body: some View {
        return VStack(spacing: 10) {
            MusicHeader(playlist: playlist)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(playlist.Albums.indices) { i in
                        NavigationLink(destination: AlbumDetail(playlist.Albums[i])) {
                            SongTableRow(
                                left: AnyView(WebImage(url: playlist.Albums[i].picture.uri)
                                    .renderingMode(.original)
                                    .resizable()
                                    .indicator(.activity)
                                    .scaledToFill()

                                    .frame(width: 50, height: 50)
                                    .cornerRadius(4)),
                                divider: i < playlist.Albums.count - 1,
                                content: playlist.Albums[i].name,
                                description: playlist.Albums[i].artist,
                                right: Constant.icon.dots
                            )
                        }
                    }
                }.padding([.top, .bottom])
                    .frame(maxWidth: .infinity)
                    .background(Constant.color.bgDefault)
                    .cornerRadius(8)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(Constant.color.gray)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.share).foregroundColor(.white))
        .navigationBarColor(Constant.color.musicPrimary.uiColor())
    }
}

struct PlaylistDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistDetail(Playlist(id: "playlist-1", title: "Little Victories", description: "", Albums: Array(musicData[0 ... 8])))
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
