//
//  LibraryList.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 27/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct Library: View {
    var albums: [Album]

    @State var selectedSong: Song? = nil

    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(albums.indices) { i in
                            HStack(spacing: -8) {
                                if i % 2 != 1 {
                                    AlbumTile(album: albums[i], selectedSong: $selectedSong)
                                }
                                if i % 2 == 0 {
                                    AlbumTile(album: albums[i + 1], selectedSong: $selectedSong)
                                }
                            }
                        }
                    }
                    .background(Constant.color.gray)
                    .navigationBarColor(Constant.color.musicPrimary.uiColor())
                    .navigationBarTitle(Text("Library"), displayMode: .large)
                    .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
                }

                if selectedSong != nil {
                    MiniPlayer(song: selectedSong!)
                }
            }
        }
    }
}

struct AlbumTile: View {
    var album: Album
    @Binding var selectedSong: Song?

    var body: some View {
        NavigationLink(
            destination: AlbumDetail(album, selectedSong: $selectedSong)
        ) {
            AlbumCard(album: album)
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library(albums: musicData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
