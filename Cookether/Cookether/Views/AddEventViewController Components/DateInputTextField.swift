//
//  DateInputTextField.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/22/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit

class DateInputTextField: UITextField {
    
    private var datePicker: UIDatePicker?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUp()
        cosmetics()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp() {
        
        datePicker = UIDatePicker()
        datePicker?.minimumDate = Date()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        inputView = datePicker
        
    }
    
    private func cosmetics() {
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("font error") }
        font = UIFontMetrics.default.scaledFont(for: customFont)
        placeholder = "Click here to pick a date"
        translatesAutoresizingMaskIntoConstraints = false
        textColor = nicePink
        
    }
    
    @objc private func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/YYYY HH:mm"
        text = dateFormater.string(from: datePicker.date)
        
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
    
    func validateIfDateIsChose() -> Bool {
        
        //Here we have to check if the date is picked
        if self.text == "" {
            print("Date is not picker")
            return false
        }
        
        return true
        
    }
}
