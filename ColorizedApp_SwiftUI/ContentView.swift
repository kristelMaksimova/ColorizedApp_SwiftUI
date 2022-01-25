//
//  ContentView.swift
//  ColorizedApp_SwiftUI
//
//  Created by Kristel Maximova on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Variable
    @State private var redSliderValue = 255.0
    @State private var greenSliderValue = 130.0
    @State private var blueSliderValue = 0.0
    
    @State private var redColor = Color.red
    @State private var greenColor = Color.green
    @State private var blueColor = Color.blue
    
    @FocusState var isInputActive: Bool
    
    //MARK: - Body
    var body: some View {
        VStack {
            RectangleSettings()
                .foregroundColor(Color(red: redSliderValue / 255,
                                       green: greenSliderValue / 255,
                                       blue: blueSliderValue / 255,
                                       opacity: 1.0))
            StackOfElements(value: $redSliderValue, color: $redColor)
            StackOfElements(value: $greenSliderValue, color: $greenColor)
            StackOfElements(value: $blueSliderValue, color: $blueColor)
            Spacer()
        }
        .padding()
        
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    isInputActive = false
                }
            }
        }   
    }
}

//MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - Template for stacks
struct StackOfElements: View {
    
    @Binding var value: Double
    @Binding var color: Color
    
    var body: some View {
        HStack {
            Text(value, format: .number)
                .frame(width: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("255", value: $value, format: .number)
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        }
    }
}

