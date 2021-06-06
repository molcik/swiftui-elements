//
//  AlbumRow.swift
//  sketch-elements
//
//  Created by Filip Krayem on 05.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct AlbumRow: View {
    
    var albumName: String
    var numberOfPhotos: Int
    var showcasedPhotos: [Photo]

    var body: some View {
        VStack(content: {
            ZStack(content: {
                Rectangle()
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.075), radius: 3, x: 0, y: 1)
                    .frame(height: 80)
                HStack(alignment: .center, content: {
                    VStack(alignment: .leading, spacing: 2, content: {
                        Text(albumName)
                            .font(.title3).bold()
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
                    URLImage(photo.urls.regular, content: {
                        $0.image
                            .resizable()
                            .aspectRatio(1/1, contentMode: .fit)
                            .border(Color.white, width: 4)
                            .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
                    })
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
    }
}
