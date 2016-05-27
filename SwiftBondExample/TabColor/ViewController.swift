//
//  ViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColorManager.sharedManager.color.observe { [weak self] color in
            self?.view.backgroundColor = color.color
        }
        
        redButton.bnd_tap.observe {
            ColorManager.sharedManager.color.value = .Red
        }
        
        greenButton.bnd_tap.observe {
            ColorManager.sharedManager.color.value = .Green
        }
        
        blueButton.bnd_tap.observe {
            ColorManager.sharedManager.color.value = .Blue
        }
    }
}

