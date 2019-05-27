//
//  NameTextField.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/22/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class NameTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        placeholder = "Name"
        textColor = nicePink
        autocorrectionType = .no
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Simple textfield validation
    func validate() -> Bool {
        
        guard let text = self.text else { return false}
        
        if text.count > 0 && text.count <= 25 {
            return true
        }
        return false
    }
    
    private func addBottomBorder() {
        
        let bottomLine = CALayer()
        let lineWidth = CGFloat(1.3)
        
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - lineWidth, width: self.frame.size.width, height: self.frame.size.height)
        bottomLine.borderColor = nicePink.cgColor
        bottomLine.borderWidth = lineWidth
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
        
    }
    
}
