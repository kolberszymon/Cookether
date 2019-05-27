//
//  AddEventViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/21/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddEventViewController: UIViewController, AddEventDelegate {
    
    //MARK: Field initialization
    
    let nameTextField = NameTextField()
    let throwADinnerLabel = ThrowADinnerLabel()
    let guestsLabel = GuestsLabel()
    let addGuestButton = AddGuestButton()
    let dateLabel = GuestsLabel()
    let dateInputTextField = DateInputTextField()
    let placeLabel = GuestsLabel()
    let pickLocationContainer = PickLocationContainer()
    let doneButton = DoneButton()
    
    //Firebase reference
    
    //let rootRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(throwADinnerLabel)
        view.addSubview(guestsLabel)
        view.addSubview(addGuestButton)
        view.addSubview(homeButton)
        
        dateLabel.text = "Date:"
        view.addSubview(dateLabel)
        view.addSubview(dateInputTextField)
        
        placeLabel.text = "Place:"
        view.addSubview(placeLabel)
        view.addSubview(doneButton)
        view.addSubview(pickLocationContainer)
        
        
        doneButton.addEventDelegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        homeButton.addTarget(self, action: #selector(AddEventViewController.showHomeScreen), for: .touchUpInside)
        setUpConstraints()
        //databaseSetUp()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
//    private func databaseSetUp() {
//        let userRef = rootRef.child("user")
//        let uidRef = userRef.child("uid")
//        let eventsRef = userRef.child("events")
//    }
    
    @objc private func showHomeScreen() {
        AppDelegate.shared.rootViewController.showHomeScreen()
    }
    
    @objc private func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func addEvent() {
        if nameTextField.validate() && dateInputTextField.validateIfDateIsChose() {
            //Save to database
            
        } else {
            print("Not ok")
        }
    }
    
    private func setUpConstraints() {
        
        throwADinnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        throwADinnerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        nameTextField.topAnchor.constraint(equalTo: throwADinnerLabel.bottomAnchor, constant: 30).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        homeButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        homeButton.topAnchor.constraint(equalTo: throwADinnerLabel.topAnchor).isActive = true
        
        guestsLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        guestsLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40).isActive = true
        
        addGuestButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        addGuestButton.topAnchor.constraint(equalTo: guestsLabel.bottomAnchor, constant: 20).isActive = true
        addGuestButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: addGuestButton.bottomAnchor, constant: 60).isActive = true
        
        dateInputTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        dateInputTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        dateInputTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15).isActive = true
        dateInputTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        placeLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        placeLabel.topAnchor.constraint(equalTo: dateInputTextField.bottomAnchor, constant: 30).isActive = true
        
        pickLocationContainer.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        pickLocationContainer.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        pickLocationContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        pickLocationContainer.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 10).isActive = true
        
        doneButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
}

let homeButton: UIButton = {
    
    let btn = UIButton(type: .custom)
    
    guard let img = UIImage(named: "backArrow") else { return UIButton() }
    btn.setImage(img, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    
    return btn
}()
