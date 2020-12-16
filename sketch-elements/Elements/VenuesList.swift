//
//  RestaurantList.swift
//  sketch-elements
//
//  Created by Filip Molcik on 16.12.2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct VenuesList<Venue: Place>: View {
    
    var venues: [Venue]
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    var tintColor = Constant.color.tintColor
    var navigationBarDisplayMode = NavigationBarItem.TitleDisplayMode.large
    var title = "Venues"
    
    var body: some View {
        
        ZStack(alignment: .top) {
            MapView(coordinate: venues[0].locationCoordinate)
                .frame(height: 180)
                .mask(
                    gradient
                )
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: 120)
                    ForEach(venues) { venue in
                        
                        
                        if let restaurant = venue as? Restaurant {
                            NavigationLink(
                                destination: RestaurantDetail(restaurant: restaurant, tintColor: tintColor)
                            ) {
                                CardWithAttachment(
                                    title: venue.title,
                                    subTitle: venue.subtitle,
                                    pictureUrl: venue.picture.uri,
                                    attachment: AnyView(Stars(venue.ratings, label: "\(venue.reviews) reviews", color: tintColor))
                                )
                            }
                        }
                        
                        
                        if let hotel = venue as? Hotel {
                            NavigationLink(
                                destination: HotelDetail(hotel: hotel, tintColor: tintColor)
                            ) {
                                
                                if (venue.featured) {
                                    CardWithBackground(
                                        title: venue.title,
                                        subTitle: venue.subtitle,
                                        height: 200,
                                        pictureUrl: venue.picture.uri                                    )
                                } else {
                                    CardWithAttachment(
                                        title: venue.title,
                                        subTitle: venue.subtitle,
                                        pictureUrl: venue.picture.uri,
                                        attachment: AnyView(Stars(venue.ratings, label: "\(venue.reviews) reviews", color: tintColor))
                                    )
                                }
                                
                            }
                        }
                        
                        
       
                    }
                }
            }
            
        }
        .background(Constant.color.gray)
        .navigationBarColor(tintColor.uiColor())
        .navigationBarTitle(Text(title), displayMode: navigationBarDisplayMode)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
    }
}

struct VenuesList_Previews: PreviewProvider {
    static var previews: some View {
        VenuesList(venues: restaurantsData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
