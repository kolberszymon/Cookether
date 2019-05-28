//
//  HomePageViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/20/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

//TODO:
//Add log out button with updating user data to logout

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import CoreLocation


class HomePageViewController: UIViewController {
    
    //MARK: UIComponents Initialization
    
    let welcomeLabel = WelcomeLabel()
    let addEventButton = AddEventButton()
    
    var ref: DatabaseReference!
    
    //MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(addEventButton)
        
        ref = Database.database().reference()
        
        let userUid = Auth.auth().currentUser!.uid
        
        ref.child("users").setValue(userUid)
        
        if let user = Auth.auth().currentUser {
            print(user.displayName!)
            welcomeLabel.text = "Hello \(user.displayName!)!"
        } else {
            print("no user")
        }
        
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: Setting up constraints
    
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

