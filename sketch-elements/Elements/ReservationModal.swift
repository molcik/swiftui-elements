//
//  ReservationModal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ReservationModal: View {
    @State var selection: Int = 0
    var place: Bookable
    var timeOptions: [String]?
    var tintColor: Color = Constant.color.tintColor
    var action: () -> Void

    var body: some View {
        VStack {
            ModalHeader(action: self.action, title: "Reservation", tintColor: tintColor)
            ScrollView(.vertical) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(place.title)
                            .font(.largeTitle)
                        Text("\(place.city), \(place.country)")
                            .opacity(0.6)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        WebImage(url: place.picture.uri)
                            .renderingMode(.original)
                            .resizable()
                            .indicator(.activity)
                            .frame(width: 140, height: 100)
                            .cornerRadius(6)
                    }
                }
                .padding([.leading, .trailing])
                Divider()
                VStack(spacing: 8) {
                    CollapsablePicker(tintColor: tintColor)
                    CountPicker(label: "people", tintColor: tintColor, defaultValue: 1)
                    if timeOptions != nil {
                        SegmentedPicker(items: timeOptions!, selection: self.$selection, tintColor: tintColor)
                    }
                    Spacer()
                }.padding([.leading, .trailing])
            }
            HStack {
                ButtonApplePay().frame(height: 44)
                    .padding(.bottom, 50)
            }.padding(30)
        }
    }
}

struct ReservationModal_Previews: PreviewProvider {
    static var previews: some View {
        ReservationModal(
            place: restaurantsData[0],
            timeOptions: ["19:00", "19:30", "20:00", "20:30"],
            action: {}).environmentObject(UserData()
        )
    }
}
