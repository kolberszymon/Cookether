//
//  AddEventButton.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/21/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class AddEventButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpButtonTarget()
        setUpLayout()
        setUpShadows()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButtonTarget() {
        self.addTarget(self, action: #selector(changeViewToAddEvent), for: .touchUpInside)
    }
    
    @objc private func changeViewToAddEvent() {
        //navigate to add event view
        AppDelegate.shared.rootViewController.showAddEventScreen()
    }
    
    private func setUpLayout() {
        layer.cornerRadius = 40
        clipsToBounds = false
        setTitle("+", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 60)
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
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
