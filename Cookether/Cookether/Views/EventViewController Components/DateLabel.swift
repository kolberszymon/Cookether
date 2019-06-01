//
//  DateLabel.swift
//  Cookether
//
//  Created by Natalia Skawińska on 28/05/2019.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class DateLabel: UILabel {
    
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
        
        font = UIFontMetrics.default.scaledFont(for: customFont)
        textAlignment = .center
        font = font.withSize(16)
        textColor = nicePink
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
