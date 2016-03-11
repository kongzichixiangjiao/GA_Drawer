//
//  HomeViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit


class HomeViewController: DrawerBaseViewController {
    
    var topBarView: GA_TopBarVIew!
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "action", name: "refreshLeftVC", object: nil)
        
        topBarView = GA_TopBarVIew.loadView()
        topBarView.frame = CGRectMake(0, 0, APPWidth, 64)
        topBarView.backHandler = backHandler
        topBarView.title = "HomeViewController"
        self.view.addSubview(topBarView)
    }
    
    lazy var backHandler: GA_TopBarVIew.BackHandler = {
        [weak self] in
        if let weakSelf = self {
            NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
        }
    }
    
    func updateTopBarView() {
        topBarView.updateView("HomeViewController")
    }
    
    func action() {
        print("refreshLeftVC")
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotificationName("restore", object: self)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}
