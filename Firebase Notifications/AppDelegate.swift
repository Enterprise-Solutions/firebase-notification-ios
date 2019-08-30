//
//  AppDelegate.swift
//  Firebase Notifications
//
//  Created by Jorge Casariego on 8/30/19.
//  Copyright © 2019 Jorge Casariego. All rights reserved.
//

import UIKit
import Firebase
//import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let viewController = ViewController()
        let navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        
        let pushManager = PushNotificationManager(userID: "currently_logged_in_user_id")
        pushManager.registerForPushNotifications()
        
        FirebaseApp.configure()
        
        
//        if #available(iOS 10.0, *) {
//            print("Entro aca")
//            let authOptions : UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(
//                options: authOptions,
//                completionHandler: {_,_ in })
//
//            // For iOS 10 display notification (sent via APNS)
//            UNUserNotificationCenter.current().delegate = self
//            // For iOS 10 data message (sent via FCM)
//            Messaging.messaging().delegate = self
//        }
        
        //application.registerForRemoteNotifications()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
//        print("Firebase registration token: \(fcmToken)")
//
//        let dataDict:[String: String] = ["token": fcmToken]
//        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
//        // TODO: If necessary send token to application server.
//        // Note: This callback is fired at each app startup and whenever a new token is generated.
//
//    }
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
//        // If you are receiving a notification message while your app is in the background,
//        // this callback will not be fired till the user taps on the notification launching the application.
//        // TODO: Handle data of notification
//
//        // With swizzling disabled you must let Messaging know about the message, for Analytics
//        // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//        // Print message ID.
//        print("UserInfo: \(userInfo)")
//
//        if let messageID = userInfo["gcm.message_id"] {
//            print("1) Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//        Messaging.messaging().appDidReceiveMessage(userInfo)
//    }

//    // TEST 1: Se llama este metodo cuando la app esta en background y el telefono prendido.
//    // TEST 2: Cuando el telefono esta apagado se recibe la notificación. Cuando damos clik abre la aplicación y se llama este metodo.
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        // Will not be called until you open your application from the remote notification (returns to foreground)
//
//        // Note: *with swizzling disabled you must let Messaging know about the message
//        // Messaging.messaging().appDidReceiveMessage(userInfo)
//
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
//    }


}

//@available(iOS 10, *)
//extension AppDelegate : UNUserNotificationCenterDelegate {
//
//    // Receive displayed notifications for iOS 10 devices.
//    // Se llama a este metodo cuando estas dentro de la aplicación. No se recibe una notificación y se recibe directamente el mensaje
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        let userInfo = notification.request.content.userInfo
//        // Print message ID.
//        print("Message ID: \(userInfo["gcm.message_id"]!)")
//
//        // Print full message.
//        print("%@", userInfo)
//
//        if let alert = userInfo["aps"] {
//            print("Alerta: \(alert)")
//        }
//
//
//    }
//
//}
//
//extension AppDelegate : MessagingDelegate {
//    // Receive data message on iOS 10 devices.
//    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
//        print("Recibimos mensaje: %@", remoteMessage.appData)
//    }
//}

