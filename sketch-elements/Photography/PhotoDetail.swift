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
    @State private var filterViewPresented = false
    @State private var cropViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Image(systemName: Constant.icon.options).onTapGesture {
                        filterViewPresented.toggle()
                    }
                    Spacer()
                    Image(systemName: Constant.icon.crop).onTapGesture {
                        cropViewPresented.toggle()
                    }
                }.padding()
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $filterViewPresented, onDismiss: {}, content: {
                FilterView(photoUrls: photo.urls)
            })
            .sheet(isPresented: $cropViewPresented, onDismiss: {}, content: {
                EditView(photoUrls: photo.urls)
            })
            .background(URLImage(photo.urls.full) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            })

            .navigationBarItems(
                leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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
