//
//  Guide.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import CoreLocation

struct Guide: Hashable, Codable, Identifiable {
    var id: String
    var country: String
    var city: String
    var picture: Picture
    var duration: Int
    var location: Coordinates
    var visits: [Visit]
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude)
    }
}

struct Visit: Hashable, Codable, Identifiable {
    var id: String {name}
    var name: String
    var address: String
}
