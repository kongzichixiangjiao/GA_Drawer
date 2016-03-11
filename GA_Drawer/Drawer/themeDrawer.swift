//
//  themeDrawer.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/11.
//  Copyright © 2016年 houjianan. All rights reserved.
//

public let APPWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let APPHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let LEADING: CGFloat = UIScreen.mainScreen().bounds.size.width * 0.3
public let MAX_LEADING: CGFloat = UIScreen.mainScreen().bounds.size.width * 0.7
public let MAXMAXMAX_LEADING: CGFloat = 1000
struct themeDrawer {

    enum DrawerState {
        case Open, None
    }
    
    static let storyboardName = "MyDrawer"

}