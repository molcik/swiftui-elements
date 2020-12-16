//
//  City.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation
import CoreLocation

struct City: Codable, Identifiable {
    var id: String
    var country: String
    var city: String
    var description: String
    var picture: Picture
    var location: Coordinates
    var restaurants: [Restaurant]
    var hotels: [Hotel]
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude)
    }
}
