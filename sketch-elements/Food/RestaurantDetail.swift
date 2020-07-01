//
//  RestaurantDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct RestaurantDetail: View {
    
    let restaurant: Restaurant
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    @EnvironmentObject var modalManager: ModalManager
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    var body: some View {
        return VStack(spacing: 0){
            Header(
                image: restaurant.picture.uri,
                title: restaurant.title
            )
            TabBar([
                TabItem(
                    name: String(repeating: "$",
                                 count: restaurant.price.expensive), icon: "creditcard"),
                TabItem(
                    name: "\(restaurant.reviews) reviews",
                    customView: Stars(restaurant.ratings).eraseToAnyView()),
                TabItem(
                    name: "\(restaurant.openings.from) - \(restaurant.openings.to)",
                    icon: "clock.fill")
            ])
            
            ZStack(alignment: .top) {
                MapView(coordinate: restaurant.locationCoordinate)
                    .frame(height: 180)
                    .mask(
                        gradient
                )
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:0) {
                        Rectangle()
                            .opacity(0)
                            .frame(height: 100)
                        ButtonPrimary( title: "Make reservation",action: self.modalManager.openModal)
                            .padding([.top, .leading, .trailing])
                        Card{
                            Text(restaurant.description)
                            .padding()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("Gray"))
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: "bookmark").foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                ReservationModal(restaurant: self.restaurant, action: self.modalManager.closeModal)
            }
        }
    }
}


struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(restaurant: restaurantsData[4])
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
