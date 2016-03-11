//
//  BaseViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class DrawerBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.hidden = true
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
    
    func initViewControllerWithIdentifier(identifier: String) -> UIViewController {
        return UIStoryboard(name: themeDrawer.storyboardName, bundle: nil).instantiateViewControllerWithIdentifier(identifier)
    }
}
