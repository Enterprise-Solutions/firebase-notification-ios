//
//  PushNotificationManager.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import Firebase
import FirebaseMessaging
import UIKit
import UserNotifications

class PushNotificationManager: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate {
    let userID: String
    init(userID: String) {
        self.userID = userID
        super.init()
    }
    
    func registerForPushNotifications() {
//        if #available(iOS 10.0, *) {
//            // For iOS 10 display notification (sent via APNS)
//            UNUserNotificationCenter.current().delegate = self
//            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(
//                options: authOptions,
//                completionHandler: {_, _ in })
//            // For iOS 10 data message (sent via FCM)
//            Messaging.messaging().delegate = self
//        } else {
//            let settings: UIUserNotificationSettings =
//                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//            UIApplication.shared.registerUserNotificationSettings(settings)
//        }
//        UIApplication.shared.registerForRemoteNotifications()
//        updateFirestorePushTokenIfNeeded()
        if #available(iOS 10.0, *) {
            print("Entro aca")
            let authOptions : UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_,_ in })
            
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            // For iOS 10 data message (sent via FCM)
            Messaging.messaging().delegate = self
        }
        
        UIApplication.shared.registerForRemoteNotifications()
        updateFirestorePushTokenIfNeeded()
    }
    
    func updateFirestorePushTokenIfNeeded() {
        if let token = Messaging.messaging().fcmToken {
            //let usersRef = Firestore.firestore().collection("users_table").document(userID)
            //usersRef.setData(["fcmToken": token], merge: true)
            // La idea aca es enviar nuestro token al servidor para que almacene nuestro token que luego podemos usar para que por ejemplo hagamos un chat y así consultar el token de otro usuario
            print("Update Token: \(token)")
        }
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Recibimos mensaje remoto: ", remoteMessage.appData)
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        updateFirestorePushTokenIfNeeded()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("1")
        let userInfo = response.notification.request.content.userInfo
        mostrarDatosNotificacion(userInfo: userInfo)
//        let userInfo = response.notification.request.content.userInfo
//        // Print message ID.
//        if let messageID = userInfo["gcmMessageIDKey"] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
        
        completionHandler()
    }
    
    func mostrarDatosNotificacion(userInfo: [AnyHashable : Any]) {
        print("userInfo: \(userInfo)")
        do {
            let alerta = try AlertaBuilder.build(from: userInfo)
            
            let respuestaController = RespuestaController()
            respuestaController.alerta = alerta
            let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            navController?.present(respuestaController, animated: true)
            
        } catch let error {
            print(error)
        }
    }
    
    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
        print("Recibimos mensaje remoto: %@", remoteMessage.appData)
    }
    
    // Receive displayed notifications for iOS 10 devices.
    // Se llama a este metodo cuando estas dentro de la aplicación. No se recibe una notificación y se recibe directamente el mensaje
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("2")
        let userInfo = notification.request.content.userInfo
        mostrarDatosNotificacion(userInfo: userInfo)
//        print("Message ID: \(userInfo["gcm.message_id"]!)")
//
//        // Print full message.
//        print("%@", userInfo)
//
//        if let alert = userInfo["aps"] {
//            print("Alerta: \(alert)")
//        }
    }
    
    // TEST 1: Se llama este metodo cuando la app esta en background y el telefono prendido.
    // TEST 2: Cuando el telefono esta apagado se recibe la notificación. Cuando damos clik abre la aplicación y se llama este metodo.
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Will not be called until you open your application from the remote notification (returns to foreground)

        // Note: *with swizzling disabled you must let Messaging know about the message
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        print("3")
        mostrarDatosNotificacion(userInfo: userInfo)
//        // Print message id
//        if let messageId = userInfo["gcm.message_id"] {
//            print("2) Message Id: \(messageId)")
//        }
//
//        // Print full message.
//        print(userInfo)
//        Messaging.messaging().appDidReceiveMessage(userInfo)
//
//        completionHandler(UIBackgroundFetchResult.newData)
//
//        if let alert = userInfo["aps"] as? [String: Any] {
//            let respuestaController = RespuestaController()
//            respuestaController.titulo = alert["title"] as? String
//            let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
//            navController?.present(respuestaController, animated: true)
//        }


    }

    
}
