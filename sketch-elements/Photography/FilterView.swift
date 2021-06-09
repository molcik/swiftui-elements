//
//  FilterView.swift
//  sketch-elements
//
//  Created by Filip Krayem on 09.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import URLImage

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var currentFilter = CIFilter.sepiaTone()
    var photoUrl: URL
    @State var image: Image? = nil


    let context = CIContext()

   

    var body: some View {
        VStack(spacing: 0) {
            
            // If there's an image with a filter, display it. Else display the original
            if image != nil {
                image!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 600)
                    .ignoresSafeArea()
            } else {
                Image(uiImage: UIImage(data: try! Data(contentsOf: photoUrl))!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 600)
                    .ignoresSafeArea()
            }
               
            
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 300, alignment: .bottom)
                    .cornerRadius(25, antialiased: true)
                    .padding(.top, -15)

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(systemName: Constant.icon.chevronDown).padding(.horizontal)
                        Spacer()
                        Text("Filters")
                            .bold()
                        Spacer()
                        Button(action: {
                            loadImage()
                        }) {
                            Text("Save")
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                    .foregroundColor(Constant.color.photographyPrimary)
                }
            }

            .ignoresSafeArea()
        }
        
    }
    
    func loadImage() {
        let inputuiImage: UIImage? = UIImage(data: try! Data(contentsOf: photoUrl))

        guard let inputImage = inputuiImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        currentFilter.intensity = Float(1)

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(photoUrl: photographyData[7].urls.full)
    }
}
