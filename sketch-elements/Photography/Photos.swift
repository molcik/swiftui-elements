//
//  Photos.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//


import SwiftUI
import URLImage

struct Photos: View {
    
    var photos: [Photo]
    var tintColor: Color = Constant.color.tintColor
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 15, content: {
                    ForEach(photos, id: \.self) { photo in
                        URLImage(photo.urls.regular, content: {
                            $0.image
                                .resizable()
                                .aspectRatio(1/1, contentMode: .fit)
                                .border(Color.white, width: 4)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.075), radius: 1, x: 0, y: 1)
                        })
                    }
                }).padding(20)
                
            }
            .frame(maxWidth: .infinity)
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.photographyPrimary.uiColor())
            .navigationBarTitle(Text("Photos"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.camera).foregroundColor(.white))
        }
    }
    
    
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos(photos: photographyData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
