//
//  DesignConstants.swift
//  WeatherEssentials
//
//  Created by denpazakura on 17/01/2024.
//

import Foundation
import SwiftUI
import UIKit

enum TextComponentStyle {
    case title,
         main,
         subtext,
         date
}

enum DesignConstants {
    // fonts
    static var titleFont: Font  {
        Font.custom("Futura", size: 46)
    }
    
    static var headerFont: Font  {
        Font.custom("Futura", size: 36)
    }
    
    static func primaryFont(for style: TextComponentStyle) -> Font {
        switch style {
        case .title:
            return Font.custom("Futura", size: 46)
        case .date:
            return Font.custom("Futura", size: 18)
        case .main:
            return Font.custom("Futura", size: 14)
        case .subtext:
            return Font.custom("Futura", size: 10)
        }
    }
    
    // frames and paddings
    static var standardPadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 40 : 80
    }
    
    static var titlePadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 20 : 80
    }
    
    static var smallPadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 10 : 20
    }
    
    static var standardElementWidth: Double {
           UIScreen.main.bounds.size.width - titlePadding * 2
       }
       
    static var cornerRadius: Double {
        12
    }
    
    static var mainBackground: Color {
        Color("Background")
    }
    
    static var mainElementBackground: Color {
        Color("MainElementBackground")
    }
    
    static var smallElementBackground: Color {
        Color("SmallElementBackground")
    }
    
    static var primaryFontColor: Color {
        Color("FontColor")
    }
}
