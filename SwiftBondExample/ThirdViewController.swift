//
//  ThirdViewController.swift
//  SwiftBondExample
//
//  Created by akio0911 on 2016/05/25.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit
import Bond

class ThirdViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet var tap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ColorManager.sharedManager.color.observe { [weak self] color in
            self?.colorView.backgroundColor = color.color
        }
    }

    @IBAction func tap(sender: AnyObject) {
        ColorManager.sharedManager.color.value
            = ColorManager.sharedManager.color.value.next
    }
}
