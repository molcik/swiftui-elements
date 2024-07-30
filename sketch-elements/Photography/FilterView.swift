//
//  FilterView.swift
//  sketch-elements
//
//  Created by Filip Krayem on 09.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Combine
import CoreImage
import CoreImage.CIFilterBuiltins
import SDWebImageSwiftUI
import SwiftUI

struct FilterView: View {
    @Environment(\.innerFullScreenModalState) var innerModalState: FullScreenModalState
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var currentFilter: CIFilter? = nil
    var photoUrls: Urls
    @State var image: Image? = nil
    @State var isLoaded = false
    let context = CIContext()

    let availableFilters: [CIFilter] = [.sepiaTone(), .colorMonochrome(), .photoEffectNoir(), .photoEffectFade(), .photoEffectTonal(), .photoEffectChrome()]

    var body: some View {
        GeometryReader { g in
            VStack(spacing: 0) {
                WebImage(url: photoUrls.full, context: [.imageTransformer: SDImageFilterTransformer(filter: currentFilter ?? CIFilter.noiseReduction())])
                    .resizable()
                    .placeholder {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 600)
                                .edgesIgnoringSafeArea(.all)
                        }
                    }
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: g.size.width, height: g.safeAreaInsets.bottom > 0 ? g.size.height * 0.83 : g.size.height * 0.7)
                    .clipped()
                    .zIndex(0)
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .frame(height: 300, alignment: .center)
                        .cornerRadius(30, antialiased: true)
                        .padding(.top, -25)
                        .zIndex(200)
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: Constant.icon.chevronDown)
                                .padding(.horizontal)
                                .onTapGesture {
                                    innerModalState.close.send()
                                }
                            Spacer()
                            Text("Filters")
                                .bold()
                            Spacer()
                            Button(
                                action: {
                                    innerModalState.close.send()
                                }) {
                                    Text("Save")
                                        .bold()
                            }
                            .padding(.horizontal)
                        }
                        .foregroundColor(Constant.color.photographyPrimary)
                        Divider().padding(.vertical)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 5) {
                                ForEach(availableFilters.indices, id: \.self) { i in
                                    WebImage(url: photoUrls.small, context: [.imageTransformer: SDImageFilterTransformer(filter: availableFilters[i])])
                                        .resizable()
                                        .placeholder {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 100, height: 100)
                                                    .foregroundColor(.gray.opacity(0.3))
                                                    .border(colorScheme == .dark ? Color.gray : Color.white, width: 1)
                                                    .padding()
                                            }
                                        }

                                        .indicator(.activity)
                                        .scaledToFill()
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .clipped()
                                        .edgesIgnoringSafeArea(.all)
                                        .border(colorScheme == .dark ? Color.gray : Color.white, width: 1)
                                        .padding()
                                        .onTapGesture {
                                            self.currentFilter = availableFilters[i]
                                        }
                                }
                            }.padding(.horizontal)
                        }
                    }

                    .zIndex(999)
                }
            }  .edgesIgnoringSafeArea(.all)
          
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(photoUrls: photographyData[7].urls).colorScheme(.dark)
    }
}
