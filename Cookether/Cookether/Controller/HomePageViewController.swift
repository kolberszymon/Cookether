//
//  HomePageViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/20/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class HomePageViewController: UIViewController {
    
    let welcomeLabel: UILabel = {
       
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("font error") }
        
        let label = UILabel()
        label.text = "Let's get started!"
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = nicePink
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let addEventButton = AddEventButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(addEventButton)
        
        if let user = Auth.auth().currentUser {
            print(user.displayName!)
            welcomeLabel.text = "Hello \(user.displayName!)!"
        } else {
            print("no user")
        }
        
        setUp()
    }
    
    func setUp() {
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        
        //If you want to have perfectly rounded button set corner radius to half of the width
        
        addEventButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        addEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEventButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        addEventButton.heightAnchor.constraint(equalTo: addEventButton.widthAnchor).isActive = true
    }
    
}
