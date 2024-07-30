//
//  EditView.swift
//  sketch-elements
//
//  Created by Filip Krayem on 14.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Mantis
import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var photoUrls: Urls

    @State private var showingCropper = false
    @State private var cropShapeType: Mantis.CropShapeType = .rect
    @State private var presetFixedRatioType: Mantis.PresetFixedRatioType = .canUseMultiplePresetFixedRatio()
    
    var body: some View {
        ImageCropper(image: UIImage(data: try! Data(contentsOf: photoUrls.regular))!,
                     cropShapeType: $cropShapeType,
                     presetFixedRatioType: $presetFixedRatioType)
            .edgesIgnoringSafeArea(.all)
    }
        
    func reset() {
        cropShapeType = .rect
        presetFixedRatioType = .canUseMultiplePresetFixedRatio()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(photoUrls: photographyData[7].urls)
    }
}

struct ImageCropper: UIViewControllerRepresentable {
    var image: UIImage
    @Binding var cropShapeType: Mantis.CropShapeType
    @Binding var presetFixedRatioType: Mantis.PresetFixedRatioType
    
    @Environment(\.innerFullScreenModalState) var innerModalState: FullScreenModalState
    
    class Coordinator: CropViewControllerDelegate {
        var parent: ImageCropper
        
        init(_ parent: ImageCropper) {
            self.parent = parent
        }
        
        func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
            parent.image = cropped
            print("transformation is \(transformation)")
            parent.innerModalState.close.send()
        }
        
        func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
            parent.innerModalState.close.send()
        }
        
        func cropViewControllerDidFailToCrop(_ cropViewController: CropViewController, original: UIImage) {}
        
        func cropViewControllerDidBeginResize(_ cropViewController: CropViewController) {}
        
        func cropViewControllerDidEndResize(_ cropViewController: CropViewController, original: UIImage, cropInfo: CropInfo) {}
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CropViewController {
        var config = Mantis.Config()
        config.cropShapeType = cropShapeType
        config.presetFixedRatioType = presetFixedRatioType
        let cropViewController = Mantis.cropViewController(image: image,
                                                           config: config)
        cropViewController.delegate = context.coordinator
        return cropViewController
    }
    
    func updateUIViewController(_ uiViewController: CropViewController, context: Context) {}
}
