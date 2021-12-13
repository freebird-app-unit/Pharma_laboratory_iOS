//
//  NotificationHelper.swift
//  Pill Reminder
//
//  Created by Jatan Ambasana on 28/08/21.
//

import UIKit
import UserNotifications
//import Firebase

class NotificationHelper: NSObject {
    
    static let shared = NotificationHelper()
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    var currentStatus: UNAuthorizationStatus = .notDetermined

    private let application = UIApplication.shared
    
    override init() {
        super.init()
        notificationCenter.delegate = self
        setCurrentNotificationPermissionStatus()
    }
    
    private func setCurrentNotificationPermissionStatus() {
        
        notificationCenter.getNotificationSettings { [self] settings in
            currentStatus = settings.authorizationStatus
            Logger.d("Current notification status:- \(currentStatus.rawValue)")
        }
        
    }
    
    func setUpForNotification(completion: ((Bool) -> Void)? = nil) {
        
        switch currentStatus {
            
            case .notDetermined:
                askForPermissionNotification { [self] isAllowed in
                    if isAllowed {
                        completion?(true)
                    } else {
                        completion?(false)
                    }
                    setCurrentNotificationPermissionStatus()
                }
            case .denied:
                // Go to settings and enable it
                break
            case .authorized:
                registerForRemoteNotificationToken()
                completion?(true)
            default:
                completion?(false)
                break
            
        }
        
    }
    
    private func askForPermissionNotification(completion: ((Bool) -> Void)?) {
        
        if #available(iOS 10.0, *) {
            
            notificationCenter.requestAuthorization(
                options: [.alert, .badge, .sound]
                
            ) { [self] isAllow, error in
                
                if let e = error {
                    completion?(false)
                    print(e)
                    return
                }
                
                if isAllow {
                    registerForRemoteNotificationToken()
                    completion?(true)
                } else {
                    completion?(false)
                }
            }
            
        }
    }
    
    private func registerForRemoteNotificationToken() {
        DispatchQueue.main.async { [self] in
            application.registerForRemoteNotifications()
        }
    }
    
}

extension NotificationHelper: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        
        
        if #available(iOS 14.0, *) {
            completionHandler([.sound, .banner])
        } else {
            completionHandler([.sound, .alert])
        }
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //AppConfig.sceneDelegate?.isAppOpenByNotification = true
        completionHandler()
    }

}

extension AppDelegate/*: MessagingDelegate*/ {
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        
        Logger.d("Apns token: \(token)")
        //Messaging.messaging().apnsToken = deviceToken as Data
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError
            error: Error
    ) {
        Logger.e("Apns Failure:- \(error)")
    }
    
//    func messaging(
//        _ messaging: Messaging,
//        didReceiveRegistrationToken fcmToken: String?
//    ) {
//        Logger.d("Firebase registration token: \(fcmToken ?? "No token")")
//        UserDefaults.standard.setValue(fcmToken, forKey: UserDefaultHelper.UserDefaultKeys.fcmToken)
//    }
    
    func registrationForNotification() {
        
        
        
//        FirebaseApp.configure()
//        Messaging.messaging().delegate = self
        
        NotificationHelper.shared.setUpForNotification()
        
        TokenManager.shared.retriveToken()
    }
    
}
