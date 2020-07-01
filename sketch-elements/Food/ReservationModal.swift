//
//  ReservationModal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct ReservationModal: View {
    
    @State var selection: Int = 0
    var restaurant: Restaurant
    var action: () -> Void
    
    var body: some View {
        VStack(){
            ModalHeader(action: self.action, title: "Reservation")
            ScrollView(.vertical){
                HStack {
                    VStack(alignment: .leading) {
                        Text(restaurant.title)
                            .font(.largeTitle)
                        Text(restaurant.address)
                            .opacity(0.6)
                        Text("\(restaurant.city), \(restaurant.country)")
                            .opacity(0.6)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        URLImage(restaurant.picture.uri, content:  {
                            $0.image
                                .renderingMode(.original)
                                .resizable()
                        })
                            .frame(width: 140, height: 100)
                            .cornerRadius(6)
                    }
                }
                .padding([.leading, .trailing])
                Divider()
                VStack {
                    CollapsablePicker()
                    SegmentedPicker(items: ["19:00", "19:30", "20:00", "20:30"], selection: self.$selection)
                    Spacer()
                }.padding()
            }
            HStack {
                ButtonApplePay().frame(height: 44)
            }.padding()
        }
    }
}


struct ReservationModal_Previews: PreviewProvider {
    static var previews: some View {
        ReservationModal(
            restaurant: restaurantsData[0],
            action: {}).environmentObject(UserData())
        
    }
}
