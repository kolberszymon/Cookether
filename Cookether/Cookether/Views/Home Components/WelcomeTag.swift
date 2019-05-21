//
//  WelcomeTag.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/20/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class WelcomeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabel() {
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("font error") }
        
        translatesAutoresizingMaskIntoConstraints = false
        text = "Hello"
        font = UIFontMetrics.default.scaledFont(for: customFont)
        adjustsFontForContentSizeCategory = true
        textAlignment = .center
        font = self.font.withSize(20)
        textColor = .white
        
    }
    
}
