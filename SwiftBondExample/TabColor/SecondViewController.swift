//
//  SecondViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var colorSegment: UISegmentedControl!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ColorManager.sharedManager.color.observe { [weak self] color in
            self?.colorLabel.text      = color.text
            self?.colorLabel.textColor = color.color
            
            self?.colorSegment.selectedSegmentIndex = color.rawValue
        }
        
        colorSegment.bnd_selectedSegmentIndex.observe { index in
            guard let color = Color(rawValue: index) else { return }
            ColorManager.sharedManager.color.value = color
        }
    }
}
