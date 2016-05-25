//
//  ColorManager.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import Foundation
import Bond

class ColorManager {
    private init() {}
    
    static let sharedManager = ColorManager()
    
    let color = Observable<Color>(.Red)
}
