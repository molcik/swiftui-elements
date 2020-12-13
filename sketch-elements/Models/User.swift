//
//  User.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

struct User: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var picture: Picture
    var cover: Picture?
    var caption: String
}
