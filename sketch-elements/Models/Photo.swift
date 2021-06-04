//
//  Photo.swift
//  sketch-elements
//
//  Created by Filip Krayem on 04.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//


import Foundation

struct Photo: Hashable, Codable, Identifiable {
    var id: String
    var album: String
    var location: Location?
    var created_at: String
    var urls: Urls
}

struct Urls: Hashable, Codable {
    var full: URL
    var regular: URL
    var small: URL
    var preview: URL
}
