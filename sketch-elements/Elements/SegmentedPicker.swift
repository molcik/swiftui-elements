//
//  SegmentedPicker.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/07/2020. Inspired by https://medium.com/better-programming/custom-ios-segmented-control-with-swiftui-473b386d0b51
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI


struct SegmentedPicker: View {
    
    var tintColor: Color = Constant.color.tintColor
    
    private let activeSegmentColor: Color
    private let backgroundColor: Color
    private let textColor: Color
    private let shadowColor: Color = Color.black.opacity(0.2)
    private let selectedTextColor: Color = Color(.white)
        
    private let segmentCornerRadius: CGFloat = 12
    private let shadowRadius: CGFloat = 4
    private let segmentXPadding: CGFloat = 8
    private let segmentYPadding: CGFloat = 12
    
    private let animationDuration: Double = 0.1
    
    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    // Rounded rectangle to denote active segment
    private var activeSegmentView: AnyView {
        return
            RoundedRectangle(cornerRadius: segmentCornerRadius)
            .foregroundColor(activeSegmentColor)
            .shadow(color: shadowColor, radius: shadowRadius)
                    .offset(x: computeActiveSegmentHorizontalOffset(width: segmentSize.width), y: 0)
                    .frame(width: segmentSize.width, height: segmentSize.height)
                    .animation(Animation.linear(duration: animationDuration))
                    .eraseToAnyView()

    }
    
    @Binding private var selection: Int
    private let items: [String]
    
    init(items: [String], selection: Binding<Int>, tintColor: Color = Constant.color.tintColor) {
        self.tintColor = tintColor
        self.activeSegmentColor = tintColor
        self.backgroundColor = tintColor.opacity(0.2)
        self.textColor = tintColor
        self._selection = selection
        self.items = items
    }
    
    var body: some View {
        // Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
        ZStack(alignment: .leading) {
            // activeSegmentView indicates the current selection
            self.activeSegmentView
            HStack(spacing: segmentXPadding) {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                        .background(self.backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: segmentCornerRadius))
                }
            }
        }

    }
    
    // Helper method to compute the offset based on the selected index
    private func computeActiveSegmentHorizontalOffset(width: CGFloat) -> CGFloat {
        CGFloat(self.selection) * (width + segmentXPadding)
    }
        
    // Gets text view for the segment
    private func getSegmentView(for index: Int) -> some View {
        guard index < self.items.count else {
            return EmptyView().eraseToAnyView()
        }
        let isSelected = self.selection == index
        return
            Text(self.items[index])
                .fontWeight(.bold)
                .foregroundColor(isSelected ? selectedTextColor: self.textColor)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity)
                // Watch for the size of the
                .padding(.vertical, segmentYPadding)
                .modifier(SizeAwareViewModifier(viewSize: self.$segmentSize))
                .onTapGesture { self.onItemTap(index: index) }
                .eraseToAnyView()
    }
    
    // On tap to change the selection
    private func onItemTap(index: Int) {
        guard index < self.items.count else {
            return
        }
        self.selection = index
    }

}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SegmentedPicker(items: ["19:00", "19:30", "20:00", "20:30"], selection: Binding.constant(1))
        }
    }
}
