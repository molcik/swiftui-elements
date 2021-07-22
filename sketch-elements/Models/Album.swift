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

struct Picture: Hashable, Codable {
    var uri: URL
    var preview: String
}
