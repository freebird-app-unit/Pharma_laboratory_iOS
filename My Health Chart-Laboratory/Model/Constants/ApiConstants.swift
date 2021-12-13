//
//  ApiConstants.swift
//  My Pharmacy
//
//  Created by Jat42 on 17/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import Foundation

struct Urls {
    
    // MARK:- Api Constants -
    
    // Base Url //
    
    private static var baseUrl : String {
        get {
            switch AppConfig.appMode {
                case .development:
                    return "http://139.59.44.157:3800/api/"
                case .production:
                    return "http://myhealthchart.in/pharma/api/"
            }
        }
    }
        
    static var socketBaseUrl : String {
        get {
            switch AppConfig.appMode {
                case .development:
                    return "http://167.172.146.209:6001/"
                case .production:
                    return "http://64.225.84.162:6001/"
            }
        }
    }
    
    // Api End Points //
    
    //=== User Module ===//
    
    static var checkVersion: String {
        baseUrl + "checkversion"
    }
    
    static var registerOtp: String {
        baseUrl + "client/registerotp"
    }
    
    static var verifyRegister: String {
        baseUrl + "client/register"
    }
    
    static var countryList: String {
        baseUrl + "countrylist"
    }
    
    static var stateList: String {
        baseUrl + "statelist"
    }
    
    static var cityList: String {
        baseUrl + "citylist"
    }
    
    static var pincodeList: String {
        baseUrl + "pincodelist"
    }
    
    static var getAgreement: String {
        baseUrl + "client/getagreement"
    }
    
    static var addPharmacyDetail: String {
        baseUrl + "client/pharmacydetail"
    }
    
    static var forgotPwd: String {
        baseUrl + "client/forgotpassword"
    }
    
    static var verifyForgotPwdOtp: String {
        baseUrl + "client/verifyforgototp"
    }
    
    static var resetPwd: String {
        baseUrl + "client/resetpassword"
    }
    
    static var loginWithOtp: String {
        baseUrl + "client/loginwithotp"
    }
    
    static var verifyAndLogin: String {
        baseUrl + "client/loginwithotp"
    }
    
    static var changePwd: String {
        baseUrl + "client/changepassword"
    }
    
    static var logout: String {
        baseUrl + "sellerlogout"
    }
    
    
}

struct Parameter {
    static let email = "email"
    static let mobileNo = "mobileNo"
}

struct SocketEvent {
    static let channelName = "CreateNewOrder"
    static let newOrder = ".NewOrder"
}
