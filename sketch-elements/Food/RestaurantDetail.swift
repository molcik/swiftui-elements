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
    
    var restaurant: Restaurant
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
                TabItem(name: "$$", icon: "dollarsign.circle"),
                TabItem(name: "129 reviews", icon: "star.fill"),
                TabItem(name: "$18:00 - 22:00", icon: "clock.fill")
            ])
            ScrollView(.vertical, showsIndicators: false) {
                ButtonPrimary( title: "See Ingredients",action: self.modalManager.openModal)
                    .padding([.top, .leading, .trailing])
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("Gray"))
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: "bookmark").foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                EmptyView()
                // IngredientsModal(restaurant: self.restaurant, action: self.modalManager.closeModal)
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
