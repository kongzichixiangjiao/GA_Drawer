//
//  LeftCellView.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class LeftCellView: UIView {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: String? {
        didSet {
            print("data")
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            print("touchesBegan")
    }
    
    

}
