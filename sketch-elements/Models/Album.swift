//
//  Playlist.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 26/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation

struct Album: Hashable, Codable, Identifiable {
    //var id: ObjectIdentifier
    //Codable
    
    var id: String
    var name: String
    var uri: URL
    
}
