//
//  Photos.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Combine
import SwiftUI

struct Photos: View {
    var photos: [Photo]
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.fullScreenModalState) var modalState: FullScreenModalState
    @State private var isPresented = false
    @State private var showPicker = false
    @State var inputImage: UIImage? = nil
    @State var selectedPhoto: Photo? = nil
    @State var photoIndex = 0

    var body: some View {
        GeometryReader { g in
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0 ..< photos.count / 3, id: \.self) { row in
                        HStack(spacing: 15) {
                            ForEach(0 ..< 3, id: \.self) { column in
                                if self.photoIndex < photos.count {
                                    PhotoPreview(url: photos[row * 3 + column].urls.regular)
                                        .onTapGesture {
                                            modalState.displayContent.send(
                                                PhotoDetail(photo: photos[row * 3 + column])
                                                    .anyView
                                            )
                                        }
                                }
                            }
                        }
                    }
                    
                    .padding(g.size.width > 500 ? 20 : 0)
                    .scaleEffect(g.size.width > 500 ? 1 : 0.92)
                }
                .frame(maxWidth: .infinity)
                .background(Constant.color.gray)
                .navigationBarColor(Constant.color.photographyPrimary.uiColor())
                .navigationBarTitle(Text("Photos"), displayMode: .large)
                .navigationBarItems(trailing:
                    Image(systemName: Constant.icon.camera)
                        .foregroundColor(.white)
                        .onTapGesture {
                            modalState.displayContent.send(
                                PhotoPicker(image: $inputImage).anyView
                            )
                        })
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
