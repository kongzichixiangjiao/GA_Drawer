//
//  DetailViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class DetailViewController: DrawerBaseViewController {

    var topBarView: GA_TopBarVIew!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBarView = GA_TopBarVIew.loadView()
        topBarView.frame = CGRectMake(0, 0, APPWidth, 64)
        topBarView.backHandler = backHandler
        topBarView.title = "DetailViewController"
        self.view.addSubview(topBarView)
    }
    
    lazy var backHandler: GA_TopBarVIew.BackHandler = {
        [weak self] in
        if let weakSelf = self {
            NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
        }
    }
    
    func updateTopBarView() {
        
    }
    
    @IBAction func action(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
    }

}
