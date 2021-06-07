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
    @State private var isPresented = false
    @State private var showCaptureImageView = false
    @State private var selectedPhoto: Photo? = nil
    @State var image: Image? = nil

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 15) {
                    ForEach(photos, id: \.self) { photo in
                        URLImage(photo.urls.regular) {
                            $0.image
                                .resizable()
                                .aspectRatio(1 / 1, contentMode: .fit)
                                .border(Color.white, width: 4)
                                .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)

                        }.onTapGesture {
                            isPresented.toggle()
                            self.selectedPhoto = photo
                        }
                    }
                }
                .padding(20)
                .fullScreenCover(item: self.$selectedPhoto) { selectedPhoto in
                    PhotoDetail(photo: selectedPhoto)
                }
            }

            .frame(maxWidth: .infinity)
            .background(Constant.color.gray)
            .navigationBarColor(Constant.color.photographyPrimary.uiColor())
            .navigationBarTitle(Text("Photos"), displayMode: .large)
            .navigationBarItems(trailing:
                Image(systemName: Constant.icon.camera)
                    .foregroundColor(.white)
                    .onTapGesture {
                        showCaptureImageView.toggle()
                    })
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
