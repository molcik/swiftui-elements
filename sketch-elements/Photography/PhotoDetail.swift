//
//  PhotoDetail.swift
//  sketch-elements
//
//  Created by Filip Krayem on 06.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import FullScreenModal
import SDWebImageSwiftUI
import SwiftUI

struct PhotoDetail: View {
    @Environment(\.fullScreenModalState) var modalState: FullScreenModalState
    var photo: Photo
    @State private var filterViewPresented = false
    @State private var cropViewPresented = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Image(systemName: Constant.icon.options).onTapGesture {
                        modalState.displayContent.send(
                            FilterView(photoUrls: photo.urls)
                                .anyView
                        )
                    }
                    Spacer()
                    Image(systemName: Constant.icon.crop).onTapGesture {
                        modalState.displayContent.send(
                            EditView(photoUrls: photo.urls).anyView
                        )
                    }
                }.padding()
                    .foregroundColor(.white)

            }.padding(.bottom)

                .background(WebImage(url: photo.urls.full)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .frame(alignment: .leading)
                ).edgesIgnoringSafeArea(.all)

                .navigationBarItems(
                    leading:
                    Button(action: {
                        modalState.close.send()
                    }) {
                        Image(systemName: Constant.icon.chevronLeft).foregroundColor(.white)
                        Text("Photos")
                    },
                    trailing:
                    Image(systemName: Constant.icon.bookmark).foregroundColor(.white)
                )
                .navigationBarTitle(Text((photo.location?.city ?? photo.location?.country) ?? "No location"), displayMode: .inline)
        }
    }
}

struct PhotoDetail_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetail(photo: photographyData[4])
    }
}
