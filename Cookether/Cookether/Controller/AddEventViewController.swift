//
//  AddEventViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/21/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

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
    
    var ref: DatabaseReference!
    
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
        
        ref = Database.database().reference()
        
        doneButton.addEventDelegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        homeButton.addTarget(self, action: #selector(AddEventViewController.showHomeScreen), for: .touchUpInside)
        setUpConstraints()
        
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    private func databaseSetUp() {
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let eventId = UUID()
        let place = ["longitude": 30, "latitude": 25]
        let time = "dzis"
        let guests = ["natalia", "ania", "tomek", "benek"]
        let name = nameTextField.text
        
        ref.child("events").child(eventId.uuidString).setValue(
            [
                "name": name!,
                "owner": userId,
                "time": time,
                "guests": guests,
                "place": place
            ]
        )
       
        
    }
    
    @objc private func showHomeScreen() {
        AppDelegate.shared.rootViewController.showHomeScreen()
    }
    
    @objc private func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func addEvent() {
        if nameTextField.validate() && dateInputTextField.validateIfDateIsChose() {
            //Save to database
            databaseSetUp()

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

extension AddEventViewController {
    
    struct Guest: Codable {
        let uid: String?
    }

    struct Place: Codable {
        let longitude: String?
        let latitude: String?
    }
    
    struct Event: Codable {
        let name: String?
        let guests: [Guest]?
        let date: String?
        let place: Place?
        
    }
}
