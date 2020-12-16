//
//  Restaurant.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/05/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import CoreLocation

struct Restaurant: Place, Bookable {
    var id: String
    var title: String
    var subtitle: String
    var featured: Bool {false}
    var ratings: Int
    var reviews: Int
    var picture: Picture
    var location: Coordinates
    var address: String
    var city: String
    var country: String
    var description: String
    var price: Price
    var openings: Openings
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude)
    }
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
