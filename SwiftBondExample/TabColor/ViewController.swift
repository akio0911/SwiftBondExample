//
//  ViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit
import Bond

internal class ViewModel {
    internal let color = ColorManager.sharedManager.color.map{ $0 }
    
    internal func changeToRed() {
        ColorManager.sharedManager.color.value = .Red
    }
    
    internal func changeToGreen() {
        ColorManager.sharedManager.color.value = .Green
    }

    internal func changeToBlue() {
        ColorManager.sharedManager.color.value = .Blue
    }
}

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.color.observe { [weak self] color in
            self?.view.backgroundColor = color.color
        }

        redButton  .bnd_tap.observe( viewModel.changeToRed   )
        greenButton.bnd_tap.observe( viewModel.changeToGreen )
        blueButton .bnd_tap.observe( viewModel.changeToBlue  )
    }
}

