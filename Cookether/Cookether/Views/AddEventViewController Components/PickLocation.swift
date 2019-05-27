//
//  PickLocation.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/24/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import MapKit
import UIKit

class PickLocation: UIView {
    
    var mapView: MKMapView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(mapView!)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
