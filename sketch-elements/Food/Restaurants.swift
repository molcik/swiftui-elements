//
//  Restaurants.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/05/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Restaurants: View {
    
    var restaurants: [Restaurant]
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        NavigationView {
            VenuesList(venues: restaurants, title: "Restaurants")
        }
    }
}


struct Restaurants_Previews: PreviewProvider {
    static var previews: some View {
        Restaurants(restaurants: restaurantsData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
