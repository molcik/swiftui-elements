//
//  Cities.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Cities: View {
    
    var cities: [City]
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // We need to iterate over every 3 items to display them in grid
                ForEach(cities) { city in
                    NavigationLink(
                        destination: CityDetail(city: city))
                    {
                        CardWithBackground(title: city.city, subTitle: city.country, height: 150, pictureUrl: city.picture.uri)
                    }
                }
            }
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.travelPrimary.uiColor())
            .navigationBarTitle(Text("Cities"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
        }
    }
}

struct Cities_Previews: PreviewProvider {
    static var previews: some View {
        Cities(cities: citiesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
