//
//  getAlbumSongs.swift
//  sketch-elements
//
//  Created by Filip Krayem on 23.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation

func getAlbumSongs(_ album: Album) -> [Song] {
    let songs: [Song] = load("Albums/" + album.id + ".json")

    return songs
}
