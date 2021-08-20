//
//  AlbumRow.swift
//  sketch-elements
//
//  Created by Filip Krayem on 05.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct AlbumRow: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.fullScreenModalState) var modalState: FullScreenModalState
    @State private var selectedPhoto: Photo? = nil
    @State private var isPresented = false
    var albumName: String
    var numberOfPhotos: Int
    var showcasedPhotos: [Photo]
    var body: some View {
        VStack(content: {
            ZStack(content: {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .init(red: 0.15, green: 0.15, blue: 0.15) : .white)
                    .shadow(color: .black.opacity(0.075), radius: 3, x: 0, y: 1)
                    .frame(height: 80)
                HStack(alignment: .center, content: {
                    VStack(alignment: .leading, spacing: 2, content: {
                        Text(albumName)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.system(size: 22)).bold()
                        Text("\(numberOfPhotos) photos")
                            .foregroundColor(.gray).font(.caption)
                    })
                    Spacer()
                    Image(systemName: Constant.icon.chevronRight)
                        .foregroundColor(.gray)
                })
                    .padding(.horizontal, 20)
            })

            HStack(content: {
                ForEach(showcasedPhotos, id: \.self, content: { photo in
                    PhotoPreview(url: photo.urls.regular)
                        .onTapGesture {
                            modalState.displayContent.send(
                                PhotoDetail(photo: photo).anyView
                            )
                        }
                })

            })
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
        })
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(albumName: "Portraits", numberOfPhotos: 30, showcasedPhotos: Array(photographyData.prefix(3)))
            .environmentObject(UserData())
            .environment(\.colorScheme, .dark)
    }
}
