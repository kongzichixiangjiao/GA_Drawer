//
//  LeftView.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class LeftView: UIView {
    
    private let APPWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
    private let APPHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    
    class func loadView() -> LeftView{
        return NSBundle.mainBundle().loadNibNamed("LeftView", owner: self, options: nil).last as! LeftView
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentSizeHeight: NSLayoutConstraint!
    
    typealias LeftViewHandler = (tag: Int) -> ()
    var leftViewHandler: LeftViewHandler!
    
    @IBAction func action(sender: UIButton) {
        leftViewHandler(tag: sender.tag)
    }
    
    override func awakeFromNib() {
        self.userInteractionEnabled = true
        contentSizeHeight.constant = APPHeight + 100
    }
    
}