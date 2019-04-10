//
//  ViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 4/2/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let loginButton = LoginButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginButton)
        setUpConstraints()
        
        
    }

    
    func setUpConstraints() {
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
}

