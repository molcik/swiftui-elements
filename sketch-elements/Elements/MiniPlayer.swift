//
//  MiniPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 02/03/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct MiniPlayer: View {
    var albums: [Album]
    @EnvironmentObject var modalManager: ModalManager
    var shownSong: Song

    init(albums: [Album]) {
        self.albums = albums

        let songs = getAlbumSongs(albums[0])
        self.shownSong = songs[0]
    }

    var body: some View {
        HStack {
            Image(systemName: Constant.icon.play)
                .frame(width: 50, height: 50, alignment: .center)
                .scaleEffect(CGSize(width: 1.4, height: 1.4))

            Button(action: { self.modalManager.openModal(position: .partiallyRevealed) }) {
                Spacer()
                VStack {
                    Text(shownSong.name)
                        .font(.headline)
                    Text(albums[0].artist)
                        .font(.subheadline)
                }
                Spacer()

            }.padding([.top, .leading, .trailing])

            URLImage(albums[0].picture.uri, content: {
                image in image
                    .renderingMode(.original)
                    .resizable()
            }).frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(3)
        }
        .padding([.horizontal, .bottom], 10.0)
        .foregroundColor(Constant.color.musicPrimary)
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                PlayerModal(action: self.modalManager.closeModal, albums: musicData)
            }
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer(albums: musicData)
    }
}
