//
//  BaseViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
         NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
    }
    
    deinit {
         NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
