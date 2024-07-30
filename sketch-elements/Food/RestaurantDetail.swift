//
//  RestaurantDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct RestaurantDetail: View {
    let restaurant: Restaurant
    var tintColor: Color = Constant.color.tintColor
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    @EnvironmentObject var modalManager: ModalManager

    init(restaurant: Restaurant, tintColor: Color = Constant.color.tintColor) {
        self.restaurant = restaurant
        self.tintColor = tintColor
    }

    var body: some View {
        return VStack(spacing: 0) {
            Header(image: restaurant.picture.uri, height: 223) {
                VStack {
                    Spacer()
                    HStack {
                        Text(restaurant.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            TabBar(
                foregroundColor: tintColor,
                content: [
                    TabItem(
                        name: String(repeating: "$",
                                     count: restaurant.price.expensive), icon: Constant.icon.creditcard),
                    TabItem(
                        name: "\(restaurant.reviews) reviews",
                        customView: Stars(restaurant.ratings, color: tintColor).eraseToAnyView()),
                    TabItem(
                        name: "\(restaurant.openings.from) - \(restaurant.openings.to)",
                        icon: Constant.icon.clock)
                ])

            ZStack(alignment: .top) {
                MapView(coordinate: restaurant.locationCoordinate)
                    .frame(height: 180)
                    .mask(
                        gradient
                    )
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        Rectangle()
                            .opacity(0)
                            .frame(height: 100)
                        ButtonPrimary(action: { self.modalManager.openModal(position: .partiallyRevealed) }, backgroundColor: tintColor) {
                            Text("Make reservation")
                                .font(.headline)
                        }.padding([.top, .leading, .trailing])
                        Card {
                            Text(restaurant.description)
                                .padding()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Constant.color.gray)
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.bookmark).foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                ReservationModal(
                    place: self.restaurant,
                    timeOptions: ["19:00", "19:30", "20:00", "20:30"],

                    tintColor: tintColor,
                    action: self.modalManager.closeModal)
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
