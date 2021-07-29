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
    @EnvironmentObject var modalManager: ModalManager
    
    @Binding var song: Song?

    var body: some View {
        HStack {
            Image(systemName: Constant.icon.play)
                .frame(width: 50, height: 50, alignment: .center)
                .scaleEffect(CGSize(width: 1.4, height: 1.4))

            Button(action: { self.modalManager.openModal(position: .partiallyRevealed) }) {
                Spacer()
                VStack {
                    Text(song!.name)
                        .font(.headline)
                    Text(song!.album!.artist)
                        .font(.subheadline)
                }
                Spacer()

            }.padding([.top])

            URLImage(song!.album!.picture.uri, content: {
                image in image
                    .renderingMode(.original)
                    .resizable()
            }).frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(3)
        }
        .padding([.horizontal, .bottom], 10.0)
        .foregroundColor(Constant.color.musicPrimary)
        .background(Color.white)
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                PlayerModal(action: self.modalManager.closeModal, song: $song)
            }
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer(song: .constant(getAlbumSongs(musicData[0])[0]))
    }
}
