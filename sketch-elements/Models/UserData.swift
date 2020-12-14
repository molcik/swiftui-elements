//
//  UserData.swift
//  sketch-elements
//
//  Created by Filip Molcik on 27/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var recipes = recipesData
    @Published var recipeCategories = recipeCategoriesData
    @Published var restaurants = restaurantsData
    @Published var stories = storiesData
    @Published var posts = postsData
    @Published var conversations = conversationsData
    @Published var cities = citiesData
    @Published var guides = guidesData
}
