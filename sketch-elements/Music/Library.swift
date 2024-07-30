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
    @EnvironmentObject var viewModel: MusicViewModel

    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(albums.indices) { i in
                            HStack(spacing: -8) {
                                if i % 2 != 1 {
                                    AlbumTile(album: albums[i])
                                }
                                if i % 2 == 0 {
                                    AlbumTile(album: albums[i + 1])
                                }
                            }
                        }
                    }
                    .background(Constant.color.gray)
                    .navigationBarColor(Constant.color.musicPrimary.uiColor())
                    .navigationBarTitle(Text("Library"), displayMode: .large)
                    .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
                }
            }
        }
    }
}

struct AlbumTile: View {
    var album: Album
    @EnvironmentObject var viewModel: MusicViewModel

    var body: some View {
        NavigationLink(
            destination: AlbumDetail(album)
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
