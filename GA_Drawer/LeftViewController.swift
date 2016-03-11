//
//  LeftViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit


class LeftViewController: DrawerBaseViewController {

    @IBAction func tap(sender: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
    }
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "action", name: "refreshLeftVC", object: nil)
    }
    
    func action() {
        print("refreshLeftVC")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}
