//
//  Location.swift
//  sketch-elements
//
//  Created by Filip Krayem on 04.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

struct Location: Hashable, Codable {
    var title: String
    var name: String
    var city: String?
    var country: String
    var position: Coordinates
}
