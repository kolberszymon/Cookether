//
//  LoginButtonView.swift
//  Cookether
//
//  Created by Dominik Kolber on 4/2/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

//Montserrat-Medium

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import Firebase

let nicePink: UIColor = UIColor(red: 209/255, green: 71/255, blue: 107/255, alpha: 1)

class LoginButton: UIView {
    
    let loginButton: UIButton = {
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("Font error")
        }
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = nicePink
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.layer.shadowOpacity = 0.48
        btn.layer.shadowColor = nicePink.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 5)
        btn.layer.shadowRadius = 8
        return btn
        
    }()
    
    let loginLabeL: UILabel = {
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: UIFont.labelFontSize) else {
            fatalError("font error") }
        
        let label = UILabel()
        label.text = "Let's get started!"
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageContainer: UIView = {
       
        let imgCont = UIView()
        imgCont.translatesAutoresizingMaskIntoConstraints = false
        imgCont.backgroundColor = .blue
        return imgCont
    }()
    
    let fbImage: UIImageView = {
       
        guard let fbImage = UIImage(named: "fbIcon") else {return UIImageView()}
        let fbImageView = UIImageView(image: fbImage)
        fbImageView.clipsToBounds = true
        fbImageView.contentMode = .center
        fbImageView.backgroundColor = .clear
        fbImageView.translatesAutoresizingMaskIntoConstraints = false
        return fbImageView
    }()
    
    @objc func login() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: LoginViewController()) { (result) in
            switch result {
            case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                
                //Successfully log into fb
                
                self.signIntoFirebase()
            case .failed(let err):
                print(err)
                
            case .cancelled:
                print("cancelled")
            }
        }
    }
    
    fileprivate func signIntoFirebase() {
        guard let authenticationToken = AccessToken.current?.authenticationToken else { return }
        let credential = FacebookAuthProvider.credential(withAccessToken: authenticationToken)
        Auth.auth().signInAndRetrieveData(with: credential) { (user, err) in
            
            //Checking for errors
            if let err = err {
                print(err)
                return
            }
            
            print("Successfully signed into firebase :).")
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        backgroundColor = nicePink
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loginButton)
        addSubview(fbImage)
        addSubview(loginLabeL)
        
        //Allow user interaction is important here because otherwise the selector will not work
        UIView.animate(withDuration: 1.15, delay: 0.1, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
            self.frame.origin.y -= 20
        })
        
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        loginLabeL.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginLabeL.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginLabeL.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginLabeL.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        fbImage.leadingAnchor.constraint(equalTo: trailingAnchor,constant: -60).isActive = true
        fbImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        fbImage.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
        fbImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//
//        fbImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
//        fbImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        
    }
    
    
}
