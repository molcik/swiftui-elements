//
//  Playlist.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 26/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation


struct Album: Hashable, Codable {
    var id: String
    var name: String
    var artist: String
    var picture: Picture
}

struct Song: Hashable, Codable {
    var name: String
    var uri: URL
    var album: Album?
}
