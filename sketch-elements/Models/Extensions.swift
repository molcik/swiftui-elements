//
//  String.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/05/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

extension String: Identifiable {
    public var id: String {
        return self
    }
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

extension Color {
 
    func uiColor() -> UIColor {

        if #available(iOS 14.0, *) {
            return UIColor(self)
        }

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
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
