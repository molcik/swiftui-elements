//
//  MusicHeader.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 05/02/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct MusicHeader: View {
    var height: CGFloat
    var album: Album?
    var playlist: Playlist?
    @State var selection: Int? = nil

    init(album: Album) {
        self.album = album
        self.playlist = nil
        self.height = 170
    }

    init(playlist: Playlist) {
        self.playlist = playlist
        self.album = nil
        self.height = 70
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 0) {
                if playlist != nil {
                    VStack(spacing: 0) {
                        HStack {
                            ForEach(playlist!.Albums[0 ... 1].map { a in
                                a.picture.uri
                            }, id: \.self) { url in
                                Spacer()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .frame(width: height/2, height: height/2)
                                    .foregroundColor(Color.white).background(
                                        WebImage(url: url)
                                            .renderingMode(.original)
                                            .resizable()
                                            .indicator(.activity)
                                    )
                            }
                        }
                        HStack {
                            ForEach(playlist!.Albums[2 ... 3].map { a in
                                a.picture.uri
                            }, id: \.self) { url in
                                Spacer()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .frame(width: height/2, height: height/2)
                                    .foregroundColor(Color.white).background(
                                        WebImage(url: url)
                                            .renderingMode(.original)
                                            .resizable()
                                            .indicator(.activity)
                                    )
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(playlist!.title)
                            .foregroundColor(Constant.color.contrast)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text(playlist!.description)
                            .font(.subheadline)
                            .foregroundColor(Constant.color.contrast)
                        Spacer()
                    }.padding([.bottom, .horizontal])
                        .padding(.top, 5)
                }

                if album != nil {
                    WebImage(url: album!.picture.uri)
                        .renderingMode(.original)
                        .resizable()
                        .indicator(.activity)
                        .frame(width: 70, height: 70)
                        .cornerRadius(4)
                        .padding(.all, 5.0)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(album!.name)
                            .foregroundColor(Constant.color.contrast)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text(album!.artist)
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .padding([.bottom, .horizontal])
                    .padding(.top, 5)
                }
            }
            .padding(.top)
            Divider()
                .frame(maxWidth: .infinity)

            HStack(spacing: -8) {
                ButtonPrimary(
                    action: { self.selection = 1 },
                    backgroundColor: Constant.color.musicButtonColor,
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.play)
                }
                .padding(.bottom)
                .padding(.trailing)

                ButtonPrimary(
                    action: { self.selection = 2 },
                    backgroundColor: Constant.color.musicButtonColor,
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.shuffle)
                }
                .padding(.leading)
                .padding(.bottom)
            }
            .padding(.top, 5.0)
        }
        .frame(height: 170)
        .frame(maxWidth: .infinity)
        .padding(.bottom, 5.0)
        .padding(.horizontal)
        .background(Constant.color.bgDefault)
    }
}

struct MusicHeader_Previews: PreviewProvider {
    static var previews: some View {
        MusicHeader(album: musicData[0])
            .environment(\.colorScheme, .dark)
    }
}
