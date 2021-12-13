//
//  ApiModel.swift
//  My Pharmacy
//
//  Created by Jat42 on 17/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import Foundation

struct CommonApiResponse: Decodable {
    
    let status : Int?
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
}

// ======= User Module ======== //

struct RegisterWithOtpResponse : Codable {
    let status : Int?
    let message : String?
    let data : RegisterWithOtpResponseData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(RegisterWithOtpResponseData.self, forKey: .data)
    }
    
}
struct RegisterWithOtpResponseData : Codable {
    let uuid : String?
    let mobileOtp : String?
    let emailOtp : String?
    
    enum CodingKeys: String, CodingKey {
        
        case uuid = "Uuid"
        case mobileOtp = "MobileOtp"
        case emailOtp = "EmailOtp"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        mobileOtp = try values.decodeIfPresent(String.self, forKey: .mobileOtp)
        emailOtp = try values.decodeIfPresent(String.self, forKey: .emailOtp)
    }
    
}

struct VerifyRegisterationOtpReponse : Codable {
    let status : Int?
    let message : String?
    let data : VerifyRegisterationOtpReponseData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(VerifyRegisterationOtpReponseData.self, forKey: .data)
    }
    
}
struct VerifyRegisterationOtpReponseData : Codable {
    let userId : Int?
    let fullName : String?
    let profilePicture : String?
    let email : String?
    let mobileNo : String?
    let apiToken : String?
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "userId"
        case fullName = "fullName"
        case profilePicture = "profilePicture"
        case email = "email"
        case mobileNo = "mobileNo"
        case apiToken = "apiToken"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        mobileNo = try values.decodeIfPresent(String.self, forKey: .mobileNo)
        apiToken = try values.decodeIfPresent(String.self, forKey: .apiToken)
    }
    
}

struct LoginResponse : Codable {
    let status : Int?
    let message : String?
    let data : LoginResponseData?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(LoginResponseData.self, forKey: .data)
    }
    
}
struct LoginResponseData : Codable {
    let userId : Int?
    let fullName : String?
    let pharmacyLogo : String?
    let profilePicture : String?
    let email : String?
    let mobileNo : String?
    let apiToken : String?
    let isPharmacyDetailComplete : String?
    let isPharmacyApproved : String?
    let pharmacyOpenCloseStatus : String?
    let pharmacyName : String?
    let referralCode : String?
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "userId"
        case fullName = "fullName"
        case pharmacyLogo = "pharmacyLogo"
        case profilePicture = "profilePicture"
        case email = "email"
        case mobileNo = "mobileNo"
        case apiToken = "apiToken"
        case isPharmacyDetailComplete = "isPharmacyDetailComplete"
        case isPharmacyApproved = "isPharmacyApproved"
        case pharmacyOpenCloseStatus = "pharmacyOpenCloseStatus"
        case pharmacyName = "pharmacyName"
        case referralCode = "referralCode"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        pharmacyLogo = try values.decodeIfPresent(String.self, forKey: .pharmacyLogo)
        profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        mobileNo = try values.decodeIfPresent(String.self, forKey: .mobileNo)
        apiToken = try values.decodeIfPresent(String.self, forKey: .apiToken)
        isPharmacyDetailComplete = try values.decodeIfPresent(String.self, forKey: .isPharmacyDetailComplete)
        isPharmacyApproved = try values.decodeIfPresent(String.self, forKey: .isPharmacyApproved)
        pharmacyOpenCloseStatus = try values.decodeIfPresent(String.self, forKey: .pharmacyOpenCloseStatus)
        pharmacyName = try values.decodeIfPresent(String.self, forKey: .pharmacyName)
        referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
    }
    
}
