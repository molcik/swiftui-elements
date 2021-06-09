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
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isPresented = false
    @State private var showPicker = false
    @State private var selectedPhoto: Photo? = nil
    @State var inputImage: UIImage? = nil

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 15) {
                    ForEach(photos, id: \.self) { photo in
                        PhotoPreview(url: photo.urls.regular)
                            .onTapGesture {
                            isPresented.toggle()
                            self.selectedPhoto = photo
                        }
                    }
                }
                .padding(20)
                .fullScreenCover(item: $selectedPhoto) { selectedPhoto in
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
                        showPicker.toggle()
                    })
            .fullScreenCover(isPresented: $showPicker, onDismiss: loadImage) {
                PhotoPicker(image: $inputImage)
        
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.inputImage = inputImage
    }
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos(photos: photographyData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
