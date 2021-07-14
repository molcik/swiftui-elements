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
import SwiftUI
import URLImage

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.urlImageService) var service: URLImageService
    @State private var currentFilter: CIFilter? = nil
    var photoUrls: Urls
    @State var image: Image? = nil
    @State var isLoaded = false
    let context = CIContext()

    let availableFilters: [CIFilter] = [.sepiaTone(), .colorMonochrome(), .photoEffectNoir(), .photoEffectFade(), .photoEffectTonal(), .photoEffectChrome()]
    var body: some View {
        VStack(spacing: 0) {
            if currentFilter != nil {
                URLImage(photoUrls.regular) { image in
                    image
                        .applyFilter(currentFilter!, url: photoUrls.regular)?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 600)
                        .ignoresSafeArea()
                }
            } else {
                URLImage(photoUrls.regular) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 600)
                        .ignoresSafeArea()
                }
            }

            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 300, alignment: .bottom)
                    .cornerRadius(25, antialiased: true)
                    .padding(.top, -25)

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(systemName: Constant.icon.chevronDown).padding(.horizontal).onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                        Spacer()
                        Text("Filters")
                            .bold()
                        Spacer()
                        Button(action: {}) {
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
                                
                                URLImage(photoUrls.small) { image in
                                    image
                                        .applyFilter(availableFilters[i], url: photoUrls.small)?
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                        .padding()
                                        .onTapGesture {
                                            self.currentFilter = availableFilters[i]
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(photoUrls: photographyData[7].urls)
    }
}

extension Image {
    func applyFilter(_ filter: CIFilter, url: URL) -> Image? {
        if let image = processImage(url, filter: filter) {
            return image
        } else {
            return nil
        }
    }

    private func processImage(_ image: URL, filter: CIFilter) -> Image? {
        let beginImage = CIImage(data: try! Data(contentsOf: image))
        filter.setValue(beginImage, forKey: kCIInputImageKey)

        if filter.conforms(to: CIFilterProtocol.self) {
            filter.setValue(10, forKey: kCIInputIntensityKey)
        }

        guard let outputImage = filter.outputImage else { return nil }

        if let cgimg = CIContext().createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
