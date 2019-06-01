//
//  PlaceButton.swift
//  Cookether
//
//  Created by Natalia Skawińska on 28/05/2019.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//
import UIKit

class PlaceButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showMap() {
        //Showing map
    }
    
    private func setUpLayout() {
        layer.cornerRadius = 15
        clipsToBounds = false
        backgroundColor = .white
        titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 16)
        titleLabel?.textAlignment = .center
        setTitleColor(nicePink, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
