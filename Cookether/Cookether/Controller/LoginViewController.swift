//
//  ViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 4/2/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginButton = LoginButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
        view.addSubview(logoImageLabel)
        setUpConstraints()
        
        
    }
    
   
    func setUpConstraints() {
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.60).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        
        logoImageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        logoImageLabel.widthAnchor.constraint(equalToConstant: 254).isActive = true
        logoImageLabel.heightAnchor.constraint(equalTo: logoImageLabel.widthAnchor, multiplier: 0.39).isActive = true
        
    }
    
    
}

