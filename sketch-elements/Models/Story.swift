//
//  Timeline.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Story: Hashable, Codable, Identifiable {
    var id: String
    var user: String
    var picture: Picture
    var seen: Bool
    var comments: [Comment]
}

struct Comment: Hashable, Codable, Identifiable {
    var id: String
    var user: String
    var comment: String
    var timestamp: Int
}



