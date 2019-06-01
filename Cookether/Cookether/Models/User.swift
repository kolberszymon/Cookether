//
//  User.swift
//  Cookether
//
//  Created by Dominik Kolber on 6/1/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import Foundation

struct User {
    
    let name: String?
    let uid: String?
    
    init(name: String?, uid: String?) {
        self.name = name ?? ""
        self.uid = uid ?? ""
    }
}
