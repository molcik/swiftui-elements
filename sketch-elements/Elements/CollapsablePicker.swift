//
//  CollapsablePicker.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/07/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct CollapsablePicker: View {
    @State private var colours = ["red", "orange"]
    @State private var selection = 4
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
                    title: dateFormatter.string(from: date),
                    action: {
                        self.pickerVisible.toggle()
                    },
                    backgroundColor: Color("BrandPrimary").opacity(0.25),
                    foregroundColor: Color("BrandPrimary"),
                    iconName: pickerVisible ? "chevron.up" : "chevron.down"
                )
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
