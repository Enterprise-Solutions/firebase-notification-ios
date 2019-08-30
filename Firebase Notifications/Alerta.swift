//
//  Alerta.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import Foundation

class Alerta {
    let alert: [String: AnyHashable]
    var title: String?
    var body: String?
    var imageUrl: String?
    
    init(alert: [String: AnyHashable]) {
        self.alert = alert
    }
    
}
