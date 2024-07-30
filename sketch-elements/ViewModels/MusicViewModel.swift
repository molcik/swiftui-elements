//
//  MusicViewModel.swift
//  sketch-elements
//
//  Created by Filip Krayem on 18.08.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

class MusicViewModel: ObservableObject {
    @Published var song = getAlbumSongs(musicData[0])[0]
    @Published var isPlaying = false
    
    func changeSong(newSong: Song) {
        song = newSong
    }
    
    func play() {
        isPlaying = true
    }
     
    func pause() {
        isPlaying = false
    }
     
    func isMusicPlaying() -> Bool {
        isPlaying
    }
}
