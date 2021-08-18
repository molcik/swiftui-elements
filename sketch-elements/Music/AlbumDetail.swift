//
//  LibraryDetail.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 04/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct AlbumDetail: View {
    var album: Album
    var songs: [Song]
    @EnvironmentObject var viewModel: MusicViewModel

    init(_ album: Album) {
        self.album = album
        songs = getAlbumSongs(album)
    }

    var body: some View {
        return VStack(spacing: 10) {
            MusicHeader(album: album)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(songs.indices) { index in
                        SongTableRow(
                            left: AnyView(Text("\(index + 1)").foregroundColor(Color.gray)),
                            divider: index < self.songs.count - 1,
                            content: songs[index].name,
                            right: Constant.icon.dots
                        ).onTapGesture {
                            viewModel.changeSong(newSong: songs[index])
                            viewModel.play()
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
        .accentColor(Constant.color.musicPrimary)
        .background(Constant.color.gray)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.share).foregroundColor(.white))
        .navigationBarColor(Constant.color.musicPrimary.uiColor())
    }
}

struct LibraryDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetail(musicData[0])
            .environmentObject(UserData())
            .environment(\.colorScheme, .dark)
    }
}
