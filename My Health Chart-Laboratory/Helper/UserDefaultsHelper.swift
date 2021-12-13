//
//  UserDefaultsHelper.swift
//  My Pharmacy
//
//  Created by Jat42 on 18/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import UIKit

class UserDefaultHelper: NSObject {
    
    static let shared = UserDefaultHelper()
    
    private let userDefault = UserDefaults.standard
    
    struct UserDefaultKeys {
        static let isLogin = "isLogin"
        static let userId = "userId"
        static let userName = "name"
        static let userEmail = "email"
        static let userMobile = "mobileNumber"
        static let profileImage = "profileImage"
        static let pharmacyId = "pharmacyId"
        static let pharmacyName = "pharmacyName"
        static let referralCode = "referralCode"
        static let apiToken = "apiToken"
        static let fcmToken = "fcmToken"
        static let userPassword = "userPassword"
    }
    
//    func saveUserData(data: LoginReponseData) {
//        userDefault.set(data.user_id, forKey: UserDefaultKeys.userId)
//        userDefault.set(data.name, forKey: UserDefaultKeys.userName)
//        userDefault.set(data.email, forKey: UserDefaultKeys.userEmail)
//        userDefault.set(data.mobile_number, forKey: UserDefaultKeys.userMobile)
//        userDefault.set(data.profile_image, forKey: UserDefaultKeys.profileImage)
//        userDefault.set(data.pharmacy_id, forKey: UserDefaultKeys.pharmacyId)
//        userDefault.set(data.pharmacy, forKey: UserDefaultKeys.pharmacyName)
//        userDefault.set(data.referral_code, forKey: UserDefaultKeys.referralCode)
//        userDefault.set(data.api_token, forKey: UserDefaultKeys.apiToken)
//        //userDefault.set(data.fcm_token, forKey: UserDefaultKeys.fcmToken)
//    }
    
    func getUserData(key: String) -> Any? {
        userDefault.value(forKey: key)
    }
    
    func setUserPassword(password: String) {
        userDefault.set(password, forKey: UserDefaultKeys.userPassword)
    }
    
    func getUserPassword() -> String {
        userDefault.string(forKey: UserDefaultKeys.userPassword) ?? ""
    }
    
    func setAutoLogin() {
        userDefault.set(true, forKey: UserDefaultKeys.isLogin)
    }
    
    func getAutoLoginStatus() -> Bool {
        userDefault.bool(forKey: UserDefaultKeys.isLogin)
    }
    
    func removeAllUserData() {
        userDefault.removeObject(forKey: UserDefaultKeys.userId)
        userDefault.removeObject(forKey: UserDefaultKeys.userName)
        userDefault.removeObject(forKey: UserDefaultKeys.userEmail)
        userDefault.removeObject(forKey: UserDefaultKeys.userMobile)
        userDefault.removeObject(forKey: UserDefaultKeys.profileImage)
        userDefault.removeObject(forKey: UserDefaultKeys.pharmacyId)
        userDefault.removeObject(forKey: UserDefaultKeys.pharmacyName)
        userDefault.removeObject(forKey: UserDefaultKeys.referralCode)
        userDefault.removeObject(forKey: UserDefaultKeys.apiToken)
//        userDefault.removeObject(forKey: UserDefaultKeys.fcmToken)
        userDefault.removeObject(forKey: UserDefaultKeys.isLogin)
        userDefault.removeObject(forKey: UserDefaultKeys.userPassword)
    }
    
}
