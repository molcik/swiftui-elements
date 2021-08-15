//
//  GuideDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct GuideDetail: View {
    var guide: Guide
    let gradient = LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
    var tintColor: Color = Constant.color.travelPrimary
    @State var selection: Int = 0
    @EnvironmentObject var modalManager: ModalManager

    var body: some View {
        return VStack(spacing: 0) {
            Header(image: guide.picture.uri, height: 223) {
                VStack {
                    Spacer()
                    HStack {
                        Text(guide.city)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            TabBar(
                foregroundColor: Constant.color.travelPrimary,
                content: [
                    TabItem(name: "\(guide.duration) days", icon: Constant.icon.clock),
                    TabItem(name: "Temperate", icon: Constant.icon.weather)
                ]
            )

            ZStack(alignment: .top) {
                MapView(coordinate: guide.locationCoordinate)
                    .frame(height: 180)
                    .mask(gradient)

                ScrollView() {
                    Rectangle()
                        .opacity(0)
                        .frame(height: 100)
                    ButtonPrimary(
                        action: { self.modalManager.openModal(position: .partiallyRevealed) },
                        backgroundColor: tintColor
                    ) {
                        Text("Book trip")
                            .font(.headline)
                    }.padding([.top, .leading, .trailing])
                    VStack(alignment: .leading) {
                        ForEach(0 ..< guide.visits.count) { index in
                            TextTableRow(
                                left: "\(index + 1)",
                                divider: index < self.guide.visits.count - 1,
                                content: self.guide.visits[index].name,
                                description: self.guide.visits[index].address
                            )
                        }
                    }.padding([.top, .bottom])
                        .frame(maxWidth: .infinity)
                        .background(Constant.color.bgDefault)
                        .cornerRadius(8)
                        .padding([.leading, .bottom, .trailing])
                    Spacer()
                }
            }.frame(maxWidth: .infinity)
        }
        .background(Constant.color.gray)
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.bookmark).foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                ReservationModal(
                    place: self.guide,
                    tintColor: tintColor,
                    action: self.modalManager.closeModal
                )
            }
        }
    }
}

struct GuideDetail_Previews: PreviewProvider {
    static var previews: some View {
        GuideDetail(guide: guidesData[2])
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
