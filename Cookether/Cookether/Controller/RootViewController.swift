//
//  RootViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/20/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private var current: UIViewController
    
    init() {
        self.current = LoginViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    func showLoginScreen() {
        
        let new = UINavigationController(rootViewController: LoginViewController())                               // 1
        
        showScreenStuff(newVC: new)
        
    }
    
    func showHomeScreen() {
        
        let homeVC = HomePageViewController()
        let new = UINavigationController(rootViewController: homeVC)
        
        animateFadeTransition(to: new)
    }
    
    func showAddEventScreen() {
        
        //Add event screen
        print("Showing add event :)")
        
    }
    
    func showScreenStuff(newVC: UIViewController) {
        addChild(newVC)
        newVC.view.frame = view.bounds
        view.addSubview(newVC.view)
        newVC.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = newVC
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()  //1
        }
    }
}
