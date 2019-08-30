//
//  AlertaBuilder.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import UIKit

enum MTError: Error {
    // Observe your transformation and extend error cases
    case missingProperty(id: String)
}

class AlertaBuilder {
    /// Build a notification from raw data
    ///
    /// - Parameter data: Classic notification payload, received from app delegate
    /// - Returns: customized MTNotification
    /// - Throws: error while building a valid MTNotification object
    static func build(from data: [AnyHashable : Any]) throws -> Alerta {
        guard let aps = data["aps"] as? [String: AnyHashable] else {
            // Do some error handlig
            throw MTError.missingProperty(id: "aps")
        }
        
        guard let alert = aps["alert"] as? [String: AnyHashable] else {
            // Do some error handlig
            throw MTError.missingProperty(id: "aps")
        }
        
        let notification = Alerta(alert: alert)
        // Assign values read as optionals from alert dictionary
        notification.title = alert["title"] as? String
        notification.body = alert["body"] as? String
        
        if let options = data["fcm_options"] as? [String: AnyHashable] {
            if let imagen = options["image"]  as? String {
                notification.imageUrl = imagen
            }
        }
        
        return notification
    }
}
