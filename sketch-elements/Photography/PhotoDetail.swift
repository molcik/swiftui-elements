//
//  PhotoDetail.swift
//  sketch-elements
//
//  Created by Filip Krayem on 06.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct PhotoDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var photo: Photo

    var body: some View {
        ZStack(alignment: .top) {
            URLImage(photo.urls.full) {
                $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .navigationBarItems(
                trailing:
                Image(systemName: Constant.icon.bookmark).foregroundColor(.white)
            )
            .navigationTitle(Text((photo.location?.city ?? photo.location?.country) ?? "No location"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PhotoDetail_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetail(photo: photographyData[4])
    }
}
