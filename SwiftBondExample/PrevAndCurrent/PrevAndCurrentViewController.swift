//
//  PrevAndCurrentViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/27.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit
import Bond

private class PrevAndCurrentViewModel {
    let current: Observable<Int?>
    
    typealias PrevAndCurrent = (prev: Int?, current: Int?)
    
    let prevAndCurrent: EventProducer<PrevAndCurrent>
    
    let prevText:    EventProducer<String>
    let currentText: EventProducer<String>
    
    init() {
        current = Observable<Int?>(nil)

        prevAndCurrent = current.reduce((nil,nil)) { pair, new in
            return (pair.1, new)
        }
        
        prevText    = prevAndCurrent.map{ $0.prev?   .description ?? "nil" }
        currentText = prevAndCurrent.map{ $0.current?.description ?? "nil" }
    }
    
    func updateNum() {
        current.value = Int(arc4random_uniform(9)) + 1
    }
}

class PrevAndCurrentViewController: UIViewController {
    
    private let viewModel = PrevAndCurrentViewModel()
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.bnd_tap.observe( viewModel.updateNum )
        
        // fix #242: startWith not working #252
        // https://github.com/SwiftBond/Bond/pull/252
        
        prevLabel   .text = "nil"
        currentLabel.text = "nil"
        
        viewModel.prevText   .bindTo(prevLabel   .bnd_text)
        viewModel.currentText.bindTo(currentLabel.bnd_text)
    }
}

