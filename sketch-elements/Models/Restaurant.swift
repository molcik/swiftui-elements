//
//  Restaurant.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/05/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Restaurant: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var subtitle: String
    var ratings: Int
    var reviews: Int
    var picture: Picture
    var coordinates: Coordinates
    var address: String
    var city: String
    var country: String
    var description: String
    var price: Price
    var openings: Openings
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}



struct Coordinates: Hashable, Codable {
    var longitude: Double
    var latitude: Double
}

struct Price: Hashable, Codable {
    var from: Int
    var to: Int
    var expensive: Int
}

struct Openings: Hashable, Codable {
    var from: String
    var to: String
}
