//
//  PrevAndCurrentViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/27.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit
import Bond

class PrevAndCurrentViewController: UIViewController {
    
    private let viewModel = PrevAndCurrentViewModel()
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevLabel:    UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.bnd_tap.observe( viewModel.updatePreviousAndCurrent )
        
        viewModel.prevText   .bindTo(prevLabel   .bnd_text)
        viewModel.currentText.bindTo(currentLabel.bnd_text)
    }
}
