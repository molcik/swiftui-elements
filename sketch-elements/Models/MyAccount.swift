//
//  MyAccount.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 29/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation

struct MyAccount: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var picture: Picture
    var caption: String
    var cover: Picture
    
}
