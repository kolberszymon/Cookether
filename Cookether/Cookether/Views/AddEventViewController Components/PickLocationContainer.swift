//
//  PickLocationContainer.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/24/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PickLocationContainer: UIView {
    
    var initialCoordinates: CGRect?
    var mapView: MKMapView?
    var locationManager = CLLocationManager()
    let distance: Double = 5000
    
    let distanceSpan: Double = 500
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        checkLocationServices()	
        mapViewInit()
        buttonInitialize()
        addTapGesture()
        cosmetics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mapViewInit() {
        
        self.mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.mapView?.translatesAutoresizingMaskIntoConstraints = false
        self.mapView?.layer.cornerRadius = 10
        addSubview(self.mapView!)
        
        self.mapView!.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.mapView!.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.mapView!.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.mapView!.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        if let mapView = self.mapView {
            let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: self.distanceSpan, longitudinalMeters: self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
        
    }
    
    private func cosmetics() {
        
        layer.cornerRadius = 10
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func buttonInitialize() {
        addSubview(backButton)
        backButton.addTarget(self, action: #selector(shrinkMap), for: .touchUpInside)
        backButton.alpha = 0
        
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
    }
    
    private func addTapGesture() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(expandMap(sender:)))
        self.addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    @objc private func expandMap(sender: UITapGestureRecognizer) {
        //Here we are expanding map to the whole screen size
        //Bug here! When clicking something what is not button we cant get back :(
        
        initialCoordinates = frame
        
        if let window = UIApplication.shared.keyWindow {
            
            
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.height)
            }) { (_) in
                backButton.alpha = 1
                UIView.animate(withDuration: 0.1, animations: {
                    self.mapView?.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.height)
                })
            }
            

        }

    }
    
    @objc private func shrinkMap() {
        
        UIView.animate(withDuration: 0.5, animations: {
            backButton.alpha = 0
            guard let initialCoords = self.initialCoordinates  else { return }
            self.mapView?.frame = initialCoords
            self.frame = initialCoords
        })
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            //We can do some good shit
            setUpLocationManager()
            checkLocationAuthorization()
        } else {
            //Inform user how to enable them
        }
    }
    
    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: distance, longitudinalMeters: distance)
            mapView?.setRegion(region, animated: true)
        }
    }
    
    private func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView?.showsUserLocation = true
            //centerViewOnUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
        
    }
    
}

extension PickLocationContainer: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //We'll be back
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error)")
    }
}

let backButton: UIButton = {
    
    let btn = UIButton(type: .custom)
    
    guard let img = UIImage(named: "backArrow") else { return UIButton() }
    btn.setImage(img, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    
    return btn
}()
