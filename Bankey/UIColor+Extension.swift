//
//  UIColor+Extension.swift
//  Bankey
//
//  Created by Eman Shedeed on 02/06/2023.
//

import UIKit

enum ColorAssets: String {
    case mainColor
}


extension UIColor {
    
    static func appColor(_ name:ColorAssets) -> UIColor? {
        switch name {
        case .mainColor:
            return UIColor(named: name.rawValue)
        }
    }
    
}


