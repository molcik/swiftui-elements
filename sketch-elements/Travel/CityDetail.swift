//
//  CityDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 15/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CityDetail: View {
    
    var city: City
    @EnvironmentObject var modalManager: ModalManager
    @State var selection: Int? = nil
    
    var body: some View {
        return VStack(spacing: 0){
            Header(image: city.picture.uri, height: 223) {
                VStack(){
                    Spacer()
                    HStack(){
                        Text(city.city)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            
            ZStack(alignment: .top) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack(spacing: -8) {
                        NavigationLink(
                            destination: RestaurantsList(restaurants: city.restaurants, tintColor: Constant.color.travelPrimary, navigationBarDisplayMode: NavigationBarItem.TitleDisplayMode.inline),
                            tag: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/,
                            selection: $selection) {
                                ButtonPrimary(
                                    action: {self.selection = 1},
                                    backgroundColor: Constant.color.travelPrimary
                                ) {
                                    Image(systemName: Constant.icon.house)
                                }.padding([.top, .leading, .trailing])
                            }
                        NavigationLink(
                            destination: RestaurantsList(restaurants: city.restaurants),
                            tag: 2,
                            selection: $selection) {
                            ButtonPrimary(
                                action: {self.selection = 2},
                                backgroundColor: Constant.color.travelPrimary
                            ) {
                                Image(systemName:Constant.icon.bed)
                            }
                            .padding([.top, .leading, .trailing])
                            }
                        
                    }

                    VStack(alignment: .leading) {
                        Card{
                            Text(city.description)
                                .padding()
                        }
                        Spacer()
                    }
                }
            }.frame(maxWidth: .infinity)
            
        }
        .background(Color("Gray"))
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: "bookmark").foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                Text("Modal")
                // IngredientsModal(recipe: self.recipe, action: self.modalManager.closeModal)
            }
        }
    }
}

struct CityDetail_Previews: PreviewProvider {
    static var previews: some View {
        CityDetail(city: citiesData[2])
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}

