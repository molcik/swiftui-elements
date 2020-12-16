//
//  Hotel.swift
//  sketch-elements
//
//  Created by Filip Molcik on 16.12.2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import CoreLocation


struct Hotel: Hashable, Codable, Identifiable, Place, Bookable {
    var id: String
    var city: String
    var country: String
    var title: String
    var subtitle: String
    var description: String
    var price: Price
    var featured: Bool
    var ratings: Int
    var reviews: Int
    var picture: Picture
    var location: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude)
    }
}

