//
//  ViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

private var myTag: Int = 2

class ViewController: BaseViewController {
    
    private let APPWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
    private let APPHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    private let LEADING: CGFloat = UIScreen.mainScreen().bounds.size.width * 0.3
    private let MAX_LEADING: CGFloat = UIScreen.mainScreen().bounds.size.width * 0.7
    
    enum DrawerState {
        case Open, None
    }
    var drawerState: DrawerState = .None
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewleadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    @IBAction func panGestureMethod(sender: UIPanGestureRecognizer) {
        if drawerState == .Open {
            return
        }
        
        let _ = sender.view
        //偏移Point
        let x = sender.translationInView(view).x
        //速率Point
        let velocityX = sender.velocityInView(view).x
        
        switch sender.state {
        case .Changed:
            switch x {
            case 0..<LEADING :
                mainViewleadingConstraint.constant = x
            case LEADING..<1000 :
                mainViewAnimation(MAX_LEADING)
                return
            default:
                break
            }
        case .Ended:
            if velocityX > 1000 {
                mainViewAnimation(MAX_LEADING)
                return
            }
            switch x {
            case 0..<LEADING :
                mainViewAnimation(0)
                break
            case LEADING..<1000 :
                mainViewAnimation(MAX_LEADING)
            default:
                break
            }
            print("Ended")
        case .Began:
            print("Began")
        default:
            break
        }
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        //        let popAnimation = POPBasicAnimation(propertyNamed: kPOPLayerPositionX)
        //        popAnimation.toValue = 0
        //        popAnimation.duration = 2.0
        //        popAnimation.repeatCount = 0
        //        mainView.layer.pop_addAnimation(popAnimation, forKey: "postionX")
        NSNotificationCenter.defaultCenter().postNotificationName("refreshLeftVC", object: self)
    }
    
    func mainViewAnimation(constant: CGFloat) {
        if constant == MAX_LEADING {
            drawerState = .Open
        } else {
            drawerState = .None
        }
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeLinear, animations: { () -> Void in
            self.mainViewleadingConstraint.constant = constant
            self.mainView.layoutIfNeeded()
            self.mainView.superview?.layoutIfNeeded()
            }) { (finish) -> Void in
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "action", name: "restore", object: nil)
        
        mainViewWidthConstraint.constant = APPWidth
        leftViewWidthConstraint.constant = UIScreen.mainScreen().bounds.size.width * 0.7
        
        createLeftView()
    }
    
    func createLeftView() {
        let v = LeftView.loadView()
        v.handler = handler
        v.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width * 0.7, APPHeight)
        leftView.addSubview(v)
    }
    
    lazy var handler: LeftView.Handler = {
        [weak self] tag in
        if let weakSelf = self {
            weakSelf.mainViewAnimation(0)
            if myTag == tag {
                return
            }
            myTag = tag
            weakSelf.toVC(tag)
        }
    }
    
    var tag = 0;
    
    func toVC(tag: Int) {
        var newController: UIViewController!
        if tag == 1 {
            newController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        } else {
            newController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        }
        let oldController = childViewControllers.last!
        print("last", childViewControllers)
        print("new", newController)
        print("old", oldController)
//        if oldController == childViewControllers[0] {
//            return
//        }

        oldController.willMoveToParentViewController(nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        
        transitionFromViewController(oldController, toViewController: newController, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil, completion: { (finished) -> Void in
            oldController.removeFromParentViewController()
            newController.didMoveToParentViewController(self)
        })
    }
    
    func action() {
        mainViewAnimation(0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
}

