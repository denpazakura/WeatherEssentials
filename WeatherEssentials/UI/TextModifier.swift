//
//  TextModifier.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

import SwiftUI

struct TextModifier: ViewModifier {
    let style: TextComponentStyle
    
    init(style: TextComponentStyle) {
        self.style = style
    }
    
    func body(content: Content) -> some View {
        content
            .font(DesignConstants.primaryFont(for: style))
            .foregroundColor(DesignConstants.primaryFontColor)
            .frame(alignment: .leading)
    }
}
