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
    @State private var currentFilter: CIFilter? = nil
    var photoUrls: Urls
    @State var image: Image? = nil
    @State var isLoaded = false
    let context = CIContext()
    let availableFilters: [CIFilter] = [.sepiaTone(), .colorMonochrome(), .photoEffectNoir(), .photoEffectFade(), .photoEffectTonal(), .photoEffectChrome()]

    var body: some View {
        VStack(spacing: 0) {
            
            URLImage(photoUrls.small) {
                // This view is displayed before download starts
                EmptyView()
            } inProgress: { _ in
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .frame(height: 600)
                    .ignoresSafeArea()
            } failure: { error, retry in
                // Display error and retry button
                VStack {
                    Text(error.localizedDescription)
                    Button("Retry", action: retry)
                }
            } content: { image in
                image
                    .applyFilter(currentFilter, url: photoUrls.small, image: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 600)
                    .ignoresSafeArea()
            }
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 300, alignment: .leading)
                    .cornerRadius(25, antialiased: true)
                    .padding(.top, -25)
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(systemName: Constant.icon.chevronDown)
                            .padding(.horizontal).onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        Text("Filters")
                            .bold()
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    .zIndex(2)
                    .foregroundColor(Constant.color.photographyPrimary)
                    Divider().padding(.vertical)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 5) {
                            ForEach(availableFilters.indices, id: \.self) { i in

                                URLImage(photoUrls.small) {
                                    // This view is displayed before download starts
                                    EmptyView()
                                } inProgress: { _ in
                                    
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray.opacity(0.3))
                                        .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                        .padding()
                                } failure: { error, retry in
                                    // Display error and retry button
                                    VStack {
                                        Text(error.localizedDescription)
                                        Button("Retry", action: retry)
                                    }
                                } content: { image in
                                    image
                                        .applyFilter(availableFilters[i], url: photoUrls.small, image: image)
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

    func getUIImageDataFromURL(_ url: URL) -> UIImage {
        return UIImage(data: try! Data(contentsOf: url))!
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(photoUrls: photographyData[7].urls)
    }
}

extension Image {
    func applyFilter(_ filter: CIFilter?, url: URL, image: Image) -> Image {
        guard filter !== nil else {
            return image
        }
        return processImage(url, filter: filter!)
    }

    private func processImage(_ image: URL, filter: CIFilter) -> Image {
        let beginImage = CIImage(data: try! Data(contentsOf: image))
        let uiImage = UIImage(ciImage: beginImage!)

        filter.setValue(beginImage, forKey: kCIInputImageKey)

        guard let outputImage = filter.outputImage else {
            return Image(uiImage: uiImage)
        }

        if let cgimg = CIContext().createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            return Image(uiImage: uiImage)
        } else {
            return Image(uiImage: uiImage)
        }
    }
}
