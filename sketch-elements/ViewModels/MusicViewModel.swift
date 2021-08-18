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
    @Published private var isPlaying_ = false
    func changeSong(newSong: Song) {
        song = newSong
    }
    
    
     func play() {
         isPlaying_ = true
     }
     
     func pause() {
        isPlaying_ = false
     }
     
     func isPlaying() -> Bool {
        isPlaying_
     }
    
}
