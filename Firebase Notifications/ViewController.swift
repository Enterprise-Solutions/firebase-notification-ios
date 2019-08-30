//
//  ViewController.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let instanceIDTokenMessage: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Hola mundo de las notificaciones"
        label.textColor = .red
        
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(instanceIDTokenMessage)
        instanceIDTokenMessage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        instanceIDTokenMessage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        instanceIDTokenMessage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        instanceIDTokenMessage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result.token)")
                self.instanceIDTokenMessage.text  = "Remote InstanceID token: \(result.token)"
            }
        }
    }


}

