//
//  EventViewController.swift
//  Cookether
//
//  Created by Natalia Skawińska on 28/05/2019.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    //    MARK: -Items
    
    let eventNameLabel = EventNameLabel()
    let dateLabel = DateLabel()
    let invitedGuestsButton = InvitedGuestsButton()
    let placeButton = PlaceButton()
    let placeLabel = PlaceLabel()
    let showLocationContainer = ShowLocationContainer()
    
    let GuestsStackView: UIStackView = {
        let gstack = UIStackView()
        gstack.backgroundColor = .red
        gstack.translatesAutoresizingMaskIntoConstraints = false
        
        return gstack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(eventNameLabel)
        view.addSubview(dateLabel)
        view.addSubview(invitedGuestsButton)
        view.addSubview(GuestsStackView)
        view.addSubview(placeButton)
        view.addSubview(placeLabel)
        view.addSubview(showLocationContainer)
        
        eventNameLabel.text = "Spaghetti Bolognese"
        dateLabel.text = "17/07/2019"
        placeButton.setTitle("U Ani", for: .normal)
        
        eventNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        eventNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 10).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        invitedGuestsButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20).isActive = true
        invitedGuestsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        GuestsStackView.topAnchor.constraint(equalTo: invitedGuestsButton.bottomAnchor, constant: 20).isActive = true
        GuestsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        GuestsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        placeLabel.topAnchor.constraint(equalTo: GuestsStackView.bottomAnchor, constant: 40).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        placeButton.topAnchor.constraint(equalTo: placeLabel.topAnchor).isActive = true
        placeButton.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor, constant: 10).isActive = true
        
        showLocationContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        showLocationContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        showLocationContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        showLocationContainer.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 20).isActive = true
        
    }
}

