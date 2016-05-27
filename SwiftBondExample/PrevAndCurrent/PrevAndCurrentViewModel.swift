//
//  PrevAndCurrentViewModel.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/28.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import Foundation
import Bond

internal class PrevAndCurrentViewModel {
    private let _current:  Observable<Int?>
    private let _previous: Observable<Int?>
    
    internal let prevText:    EventProducer<String>
    internal let currentText: EventProducer<String>
    
    internal init() {
        _current  = Observable<Int?>(nil)
        _previous = Observable<Int?>(nil)
        
        currentText = _current .map{ $0?.description ?? "nil" }
        prevText    = _previous.map{ $0?.description ?? "nil" }
    }
    
    internal func updatePreviousAndCurrent() {
        _previous.value = _current.value
        _current .value = Int(arc4random_uniform(9)) + 1
    }
}
