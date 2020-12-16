//
//  Reservable.swift
//  sketch-elements
//
//  Created by Filip Molcik on 16.12.2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation

protocol Bookable {
    var title: String { get }
    var city: String { get }
    var country: String { get }
    var picture: Picture { get }
}
