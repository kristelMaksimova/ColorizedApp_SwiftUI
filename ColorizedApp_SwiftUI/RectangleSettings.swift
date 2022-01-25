//
//  RectangleSettings.swift
//  ColorizedApp_SwiftUI
//
//  Created by Kristel Maximova on 25.01.2022.
//

import SwiftUI

struct RectangleSettings: View {
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 100)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 4))
    }
}

struct RectangleSettings_Previews: PreviewProvider {
    static var previews: some View {
        RectangleSettings()
    }
}
