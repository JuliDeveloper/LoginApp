//
//  GragientColors.swift
//  LoginApp
//
//  Created by Julia Romanenko on 27.04.2022.
//

import Foundation

import UIKit

struct GradientColors {
    
    let topColor: UIColor
    let bottomColor: UIColor
    
    static func getColors() -> GradientColors {
        GradientColors(
            topColor: UIColor(red: 255/255, green: 181/255, blue: 216/255, alpha: 1),
            bottomColor: UIColor(red: 174/255, green: 242/255, blue: 165/255, alpha: 1)
        )
    }
}

var gradientModel = GradientColors.getColors()
