//
//  AddGuestsViewController.swift
//  Cookether
//
//  Created by Dominik Kolber on 5/28/19.
//  Copyright © 2019 Szymon Kolber. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddGuestsViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var users = [User]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Add guests"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(handleBack))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        ref = Database.database().reference()
        let usersRef = ref.child("users")
        
        usersRef.observe(.childAdded) { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let name = dictionary["name"] as? String
                let userUid = dictionary["uid"] as? String
                
                let user = User(name: name, uid: userUid)
                self.users.append(user)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    @objc func handleBack() {
        AppDelegate.shared.rootViewController.showAddEventScreen()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel!.text = users[indexPath.row].name
        return cell
    }
}
