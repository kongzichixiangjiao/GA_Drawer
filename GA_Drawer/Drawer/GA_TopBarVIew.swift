//
//  GA_TopBarVIew.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/11.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_TopBarVIew: UIView {
    
    class func loadView(title: String = "") -> GA_TopBarVIew {
        return NSBundle.mainBundle().loadNibNamed("GA_TopBarVIew", owner: self, options: nil).last as! GA_TopBarVIew
    }

    typealias BackHandler = () -> ()
    var backHandler: BackHandler!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func back(sender: UIButton) {
        guard let handler = backHandler
            else {return}
        handler()
    }
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    func updateView(title: String, backColor: UIColor = UIColor.whiteColor()) {
        titleLabel.text = ""
        titleLabel.text = title
    }
    
}
