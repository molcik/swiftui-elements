//
//  HotelDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 16.12.2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct HotelDetail: View {
    
    let hotel: Hotel
    var tintColor: Color = Constant.color.tintColor
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    @EnvironmentObject var modalManager: ModalManager
    
    init(hotel: Hotel, tintColor: Color = Constant.color.tintColor ) {
        self.hotel = hotel
        self.tintColor = tintColor
    }
    
    var body: some View {
        return VStack(spacing: 0){
            Header(image: hotel.picture.uri, height: 223) {
                VStack(){
                    Spacer()
                    HStack(){
                        Text(hotel.title)
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
                                     count: hotel.price.expensive), icon: Constant.icon.creditcard),
                    TabItem(
                        name: "\(hotel.reviews) reviews",
                        customView: Stars(hotel.ratings, color: tintColor).eraseToAnyView()),
                ])
            
            ZStack(alignment: .top) {
                MapView(coordinate: hotel.locationCoordinate)
                    .frame(height: 180)
                    .mask(
                        gradient
                    )
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:0) {
                        Rectangle()
                            .opacity(0)
                            .frame(height: 100)
                        ButtonPrimary(action: self.modalManager.openModal, backgroundColor: tintColor) {
                            Text("Make reservation")
                                .font(.headline)
                        }.padding([.top, .leading, .trailing])
                        Card{
                            Text(hotel.description)
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
                    place: self.hotel,
                    timeOptions: ["19:00", "19:30", "20:00", "20:30"],
                
                    tintColor: tintColor,
                    action: self.modalManager.closeModal)
            }
        }
    }
}


struct HotelDetail_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetail(hotel: citiesData[0].hotels[0])
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}

