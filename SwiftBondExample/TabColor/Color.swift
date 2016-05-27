//
//  Color.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import Foundation
import UIKit

enum Color: Int {
    case Red
    case Green
    case Blue
    
    var color: UIColor {
        switch self {
        case .Red:   return UIColor.redColor()
        case .Green: return UIColor.greenColor()
        case .Blue:  return UIColor.blueColor()
        }
    }
    
    var text: String {
        switch self {
        case .Red:   return "Red"
        case .Green: return "Green"
        case .Blue:  return "Blue"
        }
    }
    
    var next: Color {
        switch self {
        case .Red:   return .Green
        case .Green: return .Blue
        case .Blue:  return .Red
        }
    }
}
