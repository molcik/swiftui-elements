//
//  SegmentedPickerCollapsed.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI


struct SegmentedPickerCollapsed: View {
    private static let activeSegmentColor: Color = Constant.color.contrast.opacity(0.8)
    private static let backgroundColor: Color = Constant.color.bgDefault.opacity(0.5)
    private static let shadowColor: Color = Color.black.opacity(0.2)
    private static let textColor: Color = Constant.color.contrast
    private static let selectedTextColor: Color = Constant.color.bgDefault
        
    private static let segmentCornerRadius: CGFloat = 8
    private static let shadowRadius: CGFloat = 4
    private static let segmentXPadding: CGFloat = 8
    private static let segmentYPadding: CGFloat = 12
    
    private static let animationDuration: Double = 0.1
    
    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    // Rounded rectangle to denote active segment
    private var activeSegmentView: AnyView {
        return
            Rectangle()
            .foregroundColor(SegmentedPickerCollapsed.activeSegmentColor)
            .shadow(color: SegmentedPickerCollapsed.shadowColor, radius: SegmentedPickerCollapsed.shadowRadius)
                    .offset(x: computeActiveSegmentHorizontalOffset(width: segmentSize.width), y: 0)
                    .frame(width: segmentSize.width, height: segmentSize.height)
                    .animation(Animation.linear(duration: SegmentedPickerCollapsed.animationDuration))
                    .eraseToAnyView()

    }
    
    @Binding private var selection: Int
    private let items: [String]
    
    init(items: [String], selection: Binding<Int>) {
        self._selection = selection
        self.items = items
    }
    
    var body: some View {
        // Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
        ZStack(alignment: .leading) {
            // activeSegmentView indicates the current selection
            self.activeSegmentView
            HStack(spacing: SegmentedPickerCollapsed.segmentXPadding) {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                }
            }
        }
        .background(SegmentedPickerCollapsed.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: SegmentedPickerCollapsed.segmentCornerRadius))

    }
    
    // Helper method to compute the offset based on the selected index
    private func computeActiveSegmentHorizontalOffset(width: CGFloat) -> CGFloat {
        CGFloat(self.selection) * (width + SegmentedPickerCollapsed.segmentXPadding)
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
                .foregroundColor(isSelected ? SegmentedPickerCollapsed.selectedTextColor: SegmentedPickerCollapsed.textColor)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity)
                // Watch for the size of the
                .padding(.vertical, SegmentedPickerCollapsed.segmentYPadding)
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

struct SegmentedPickerCollapsed_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SegmentedPickerCollapsed(items: ["Posts", "Comments", "Likes"], selection: Binding.constant(0))
        }
        .frame(height: 200)
        .background(Color.green)
    }
}
