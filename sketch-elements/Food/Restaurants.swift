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
            ZStack(alignment: .top) {
                MapView(coordinate: restaurants[0].locationCoordinate)
                    .frame(height: 180)
                    .mask(
                        gradient
                )
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:0) {
                        Rectangle()
                            .opacity(0)
                            .frame(height: 120)
                        ForEach(restaurants) { restaurant in
                            NavigationLink(
                                destination: RestaurantDetail(restaurant: restaurant)
                            ) {
                                CardWithAttachment(
                                    title: restaurant.title,
                                    subTitle: restaurant.subtitle,
                                    pictureUrl: restaurant.picture.uri,
                                    attachment: AnyView(Stars(restaurant.ratings, label: "\(restaurant.reviews) reviews"))
                                )
                            }
                        }
                    }
                }
            }
            .background(Color("Gray"))
            .navigationBarColor(UIColor(named:"BrandPrimary"))
            .navigationBarTitle(Text("Restaurants"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass").foregroundColor(.white))
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
