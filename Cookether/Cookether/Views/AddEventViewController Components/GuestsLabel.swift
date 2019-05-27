//
//  GuestsLabel.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/22/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class GuestsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("font error") }
        
        text = "Guests:"
        font = UIFontMetrics.default.scaledFont(for: customFont)
        textAlignment = .center
        font = font.withSize(18)
        textColor = nicePink
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}


