//
//  CollapsablePicker.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/07/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct CollapsablePicker: View {
    var tintColor: Color = Constant.color.tintColor
    
    @State private var pickerVisible = false
    @State private var date = Date()
    @State private var pickerReset = UUID()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack {
                ButtonPrimary(
                    action: {
                        self.pickerVisible.toggle()
                    },
                    backgroundColor: tintColor.opacity(0.2),
                    foregroundColor: tintColor

                ) {
                    Image(systemName: pickerVisible ? Constant.icon.chevronUp : Constant.icon.chevronDown)
                    Text("\(dateFormatter.string(from: date))")
                        .font(.headline)
                }
            }
            if pickerVisible {
                HStack {
                    DatePicker(
                        selection: $date,
                        in: Date()...,
                        displayedComponents: .date,
                        label: { Text("Date") }
                    )
                    .labelsHidden()
                }
            }
        }
    }
}
    
struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        CollapsablePicker()
    }
}
