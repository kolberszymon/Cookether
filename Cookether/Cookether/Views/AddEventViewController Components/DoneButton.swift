//
//  DoneButton.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/27/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class DoneButton: UIButton {
    
    var addEventDelegate: AddEventDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpButtonTarget()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp() {
        setTitle("Done", for: .normal)
        tintColor = nicePink
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = nicePink
        layer.cornerRadius = 5
        
    }
    
    private func setUpButtonTarget() {
        self.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
    }
    
    @objc private func addEvent() {
        addEventDelegate.addEvent()
    }
}
