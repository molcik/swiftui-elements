//
//  Post.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

struct Post: Hashable, Codable, Identifiable {
    var id: String
    var user: String
    var picture: Picture?
    var caption: String
    var timestamp: Double
    var comments: [String]
}
