//
//  AddGuestButton.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/22/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class AddGuestButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(addGuest), for: .touchUpInside)
        
        setUpLayout()
        setUpShadows()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addGuest() {
        //Showing new screen with tableview of possible users
        AppDelegate.shared.rootViewController.showAddGuestsScreen()

    }
    
    private func setUpLayout() {
        layer.cornerRadius = 15
        clipsToBounds = false
        setTitle("add guest", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.textAlignment = .center
        backgroundColor = nicePink
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpShadows() {
        
        layer.shadowOpacity = 0.6
        layer.shadowColor = nicePink.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 5
        
        
    }
}
