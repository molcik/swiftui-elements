//
//  Album.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 27/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation

struct Playlist: Hashable, Codable, Identifiable {
    var id: String
    var Albums: [Album]
}
