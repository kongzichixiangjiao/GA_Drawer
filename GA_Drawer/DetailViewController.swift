//
//  DetailViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class DetailViewController: DrawerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
    }

}
