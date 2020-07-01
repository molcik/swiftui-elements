//
//  SegmentedPicker.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/07/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
struct BackgroundGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            return Color
                .clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}
struct SizeAwareViewModifier: ViewModifier {
    
    @Binding private var viewSize: CGSize
    
    init(viewSize: Binding<CGSize>) {
        self._viewSize = viewSize
    }
    
    func body(content: Content) -> some View {
        content
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self, perform: { if self.viewSize != $0 { self.viewSize = $0 }})
    }
}

struct SegmentedPicker: View {
    private static let ActiveSegmentColor: Color = Color("BrandPrimary")
    private static let BackgroundColor: Color = Color("BrandPrimary").opacity(0.2)
    private static let ShadowColor: Color = Color.black.opacity(0.2)
    private static let TextColor: Color = Color("BrandPrimary")
    private static let SelectedTextColor: Color = Color(.white)
        
    private static let SegmentCornerRadius: CGFloat = 12
    private static let ShadowRadius: CGFloat = 4
    private static let SegmentXPadding: CGFloat = 8
    private static let SegmentYPadding: CGFloat = 12
    private static let PickerPadding: CGFloat = 0
    
    private static let AnimationDuration: Double = 0.1
    
    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    // Rounded rectangle to denote active segment
    private var activeSegmentView: AnyView {
        // Don't show the active segment until we have initialized the view
        // This is required for `.animation()` to display properly, otherwise the animation will fire on init
        let isInitialized: Bool = segmentSize != .zero
        if !isInitialized { return EmptyView().eraseToAnyView() }
        return
            RoundedRectangle(cornerRadius: SegmentedPicker.SegmentCornerRadius)
                .foregroundColor(SegmentedPicker.ActiveSegmentColor)
                //.shadow(color: SegmentedPicker.ShadowColor, radius: SegmentedPicker.ShadowRadius)
                .frame(width: self.segmentSize.width, height: self.segmentSize.height)
                .padding(.horizontal, SegmentedPicker.SegmentXPadding)
                .offset(x: self.computeActiveSegmentHorizontalOffset(), y: 0)
                .animation(Animation.linear(duration: SegmentedPicker.AnimationDuration))
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
            HStack(spacing: 0) {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                        .background(SegmentedPicker.BackgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: SegmentedPicker.SegmentCornerRadius))
                        .padding(.horizontal, SegmentedPicker.SegmentXPadding)
                }
            }
        }
        .padding(SegmentedPicker.PickerPadding)

    }
    
    // Helper method to compute the offset based on the selected index
    private func computeActiveSegmentHorizontalOffset() -> CGFloat {
        CGFloat(self.selection) * (self.segmentSize.width + 2 * SegmentedPicker.SegmentXPadding)
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
                .foregroundColor(isSelected ? SegmentedPicker.SelectedTextColor: SegmentedPicker.TextColor)
                .lineLimit(1)
                .padding(.vertical, SegmentedPicker.SegmentYPadding)
                .frame(minWidth: 0, maxWidth: .infinity)
                // Watch for the size of the
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

        SegmentedPicker(items: ["19:00", "19:30", "20:00", "20:30"], selection: Binding.constant(1))
            .padding()
    }
}
