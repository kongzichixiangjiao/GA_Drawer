//
//  ViewController.swift
//  GA_Drawer
//
//  Created by houjianan on 16/3/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    private var LeftViewButtonTag: Int = 2
    
    var drawerState: themeDrawer.DrawerState = .None
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewleadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    @IBAction func panGestureMethod(sender: UIPanGestureRecognizer) {
        if drawerState == .Open {return}
        
        let x = sender.translationInView(view).x
        let velocityX = sender.velocityInView(view).x
        
        switch sender.state {
        case .Changed:
            panGestureMethodChanged(x)
        case .Ended:
            panGestureMethodEnded(x, velocityX: velocityX)
        case .Began:
            print("Began")
        default:
            break
        }
    }
    
    private func panGestureMethodEnded(x: CGFloat, velocityX: CGFloat) {
        if velocityX > MAXMAXMAX_LEADING {
            mainViewAnimation(MAX_LEADING)
            return
        }
        switch x {
        case 0..<LEADING :
            mainViewAnimation(0)
            break
        case LEADING..<MAXMAXMAX_LEADING :
            mainViewAnimation(MAX_LEADING)
        default:
            break
        }
        print("Ended")
    }
    
    private func panGestureMethodChanged(x: CGFloat) {
        switch x {
        case 0..<LEADING :
            mainViewleadingConstraint.constant = x
        case LEADING..<MAXMAXMAX_LEADING :
            mainViewAnimation(MAX_LEADING)
            return
        default:
            break
        }
    }
    
    
    private func mainViewAnimation(constant: CGFloat) {
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
    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotificationName("refreshLeftVC", object: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotificationObserver()
        updateConstant()
        createLeftView()
    }
    
    private func addNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "action", name: "restore", object: nil)
    }
    
    private func updateConstant() {
        mainViewWidthConstraint.constant = APPWidth
        leftViewWidthConstraint.constant = UIScreen.mainScreen().bounds.size.width * 0.7
    }
    
    private func createLeftView() {
        let v = LeftView.loadView()
        v.leftViewHandler = leftViewHandler
        v.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width * 0.7, APPHeight)
        leftView.addSubview(v)
    }
    
    lazy var leftViewHandler: LeftView.LeftViewHandler = {
        [weak self] tag in
        if let weakSelf = self {
            weakSelf.mainViewAnimation(0)
            if weakSelf.LeftViewButtonTag == tag {
                return
            }
            weakSelf.LeftViewButtonTag = tag
            weakSelf.toVC(tag)
        }
    }
    
    var tag = 0;
    
    func toVC(tag: Int) {
        var newController: UIViewController!
        if tag == 1 {
            newController = UIStoryboard(name: themeDrawer.storyboardName, bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        } else {
            newController = UIStoryboard(name: themeDrawer.storyboardName, bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        }
        let oldController = childViewControllers.last!
        
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

