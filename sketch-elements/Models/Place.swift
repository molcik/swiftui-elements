//
//  Place.swift
//  sketch-elements
//
//  Created by Filip Molcik on 16.12.2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import CoreLocation

protocol Place: Identifiable, Codable {
    var title: String { get }
    var description: String { get }
    var price: Price { get }
    var featured: Bool { get }
    var subtitle: String { get }
    var ratings: Int { get }
    var reviews: Int { get }
    var picture: Picture { get }
    var locationCoordinate: CLLocationCoordinate2D { get }
}
