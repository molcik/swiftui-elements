//
//  Recipe.swift
//  sketch-elements
//
//  Created by Filip Molcik on 27/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var people: Int
    var minutes: Int
    var instructions: [String]
    var ingredients: [Ingredient]
    var picture: Picture
    var category: String
}

struct Category: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var subtitle: String
    var picture: Picture
}

struct Ingredient: Hashable, Codable, Identifiable {
    var id: String {name}
    var checked: Bool
    var name: String
    var quantity: String
}

struct Instruction: Hashable, Codable, Identifiable {
    var description: String
    var id: String {description}
}



