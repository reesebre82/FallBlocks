//
//  ColorPalette.swift
//  FallBlocks2
//
//  Created by Brendan Reese on 7/23/21.
//

import Foundation
import UIKit

class ColorPalette{
    static func getColor(_ choice: Int) -> UIColor {
        switch choice {
        case 0:
            return .white
        case 1:
            return UIColor(red: 0.99, green: 0.94, blue: 0.93, alpha: 1.00)
        case 2:
            return UIColor(red: 0.98, green: 0.89, blue: 0.85, alpha: 1.00)
        case 3:
            return UIColor(red: 0.98, green: 0.87, blue: 0.79, alpha: 1.00)
        case 4:
            return UIColor(red: 0.98, green: 0.83, blue: 0.78, alpha: 1.00)
        case 5:
            return UIColor(red: 0.97, green: 0.77, blue: 0.71, alpha: 1.00)
        case 6:
            return UIColor(red: 0.96, green: 0.71, blue: 0.64, alpha: 1.00)
        case 7:
            return UIColor(red: 0.95, green: 0.65, blue: 0.56, alpha: 1.00)
        case 8:
            return UIColor(red: 0.95, green: 0.60, blue: 0.49, alpha: 1.00)
        case 9:
            return UIColor(red: 0.94, green: 0.54, blue: 0.42, alpha: 1.00)
        case 10:
            return UIColor(red: 0.93, green: 0.49, blue: 0.35, alpha: 1.00)
        case 11:
            return UIColor(red: 0.93, green: 0.43, blue: 0.27, alpha: 1.00)
        case 12:
            return UIColor(red: 0.92, green: 0.37, blue: 0.20, alpha: 1.00)
        case 13:
            return UIColor(red: 0.91, green: 0.31, blue: 0.13, alpha: 1.00)
        case 14:
            return UIColor(red: 0.87, green: 0.27, blue: 0.09, alpha: 1.00)
        case 15:
            return UIColor(red: 0.80, green: 0.25, blue: 0.08, alpha: 1.00)
        case 16:
            return UIColor(red: 0.73, green: 0.23, blue: 0.07, alpha: 1.00)
        case 17:
            return UIColor(red: 0.65, green: 0.20, blue: 0.07, alpha: 1.00)
        case 18:
            return UIColor(red: 0.58, green: 0.18, blue: 0.06, alpha: 1.00)
        case 19:
            return UIColor(red: 0.51, green: 0.16, blue: 0.05, alpha: 1.00)
        case 20:
            return UIColor(red: 0.44, green: 0.14, blue: 0.05, alpha: 1.00)
        case 21:
            return UIColor(red: 0.36, green: 0.11, blue: 0.04, alpha: 1.00)
        case 22:
            return UIColor(red: 0.29, green: 0.09, blue: 0.03, alpha: 1.00)
        case 23:
            return UIColor(red: 0.22, green: 0.07, blue: 0.02, alpha: 1.00)
        case 24:
            return UIColor(red: 0.15, green: 0.05, blue: 0.02, alpha: 1.00)
        case 25:
            return UIColor(red: 0.07, green: 0.02, blue: 0.01, alpha: 1.00)
        default:
            return UIColor(red: 0.07, green: 0.02, blue: 0.01, alpha: 1.00)
        }
    }
}
