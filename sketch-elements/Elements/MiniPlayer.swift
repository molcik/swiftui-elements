//
//  MiniPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 02/03/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Combine
import Foundation
import SDWebImageSwiftUI
import SwiftUI

struct MiniPlayer: View {
    @EnvironmentObject var modalManager: ModalManager
    @EnvironmentObject var viewModel: MusicViewModel

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: viewModel.isMusicPlaying() ? Constant.icon.pause : Constant.icon.play)
                .frame(width: 50, height: 50, alignment: .center)
                .scaleEffect(CGSize(width: 1.4, height: 1.4))
                .onTapGesture {
                    
                    if (viewModel.isMusicPlaying()) {
                        viewModel.pause()
                    } else {
                        viewModel.play()
                    }
                }

            Button(action: { self.modalManager.openModal(position: .partiallyRevealed) }) {
                Spacer()
                VStack {
                    Text(viewModel.song.name)
                        .font(.headline)
                    Text(viewModel.song.album!.artist)
                        .font(.subheadline)
                }
                Spacer()
            }

            WebImage(url: viewModel.song.album!.picture.uri)
                .renderingMode(.original)
                .resizable()
                .indicator(.activity)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(3)
        }
        .padding(10.0)
        .foregroundColor(Constant.color.musicPrimary)
        .background(Constant.color.bgDefault)
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                PlayerModal(action: self.modalManager.closeModal, modalState: $modalManager.modal.position, viewModel: viewModel)
            }
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer().colorScheme(.dark)
    }
}
