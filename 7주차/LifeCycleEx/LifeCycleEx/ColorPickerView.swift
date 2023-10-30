//
//  ColorPickerView.swift
//  LifeCycleEx
//
//  Created by kwon ji won on 10/26/23.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        
        ColorPicker("Select Color", selection: $selectedColor)
            .padding()
    }
}

//#Preview {
//    ColorPickerView(selectedColor: Blue)
//}
