//
//  OrderModels.swift
//  My Pharmacy
//
//  Created by Jat42 on 21/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import UIKit

enum OrderTypes {
    case asPerPrescription
    case fullOrder(Int)
    case selectedItem
    case manualOrder
    
    var appDisplayString: String {
        get {
            switch self {
                case .asPerPrescription:
                    return "As per prescription"
                case .fullOrder(let days):
                    return "Full order for \(days) days"
                case .selectedItem:
                    return "Selected items"
                case .manualOrder:
                    return "Manual Order"
            }
        }
    }
    
    var serverConstants: String {
        get {
            switch self {
                case .asPerPrescription:
                    return "as_per_prescription"
                case .fullOrder(_):
                    return "full_order"
                case .selectedItem:
                    return "selected_item"
                case .manualOrder:
                    return "manual_order"
            }
        }
    }
    
}

enum ExternalDeliveryInitiateBy: String {
    case customer
    case pharmacy
    case seller
}

struct FilterApplied {
    let fromDate: String
    let endDate: String
    let selectedId: String
}

struct RegisterationModel {
    let firmType: Int
    let fullName: String
    let partnerName: String
    let email: String
    let pharmacyOwnerMobileNumber: String?
    let pharmacyServiceMobileNumber: String?
    let pharmacyManagerMobileNumber: String?
    let drugLicenceNumber: String
    let validUpToYear: String
    let password: String
    let partnerShipDeed: [MediaData]?
    let drugLicence: [MediaData]
    let adharCardFrontSide: MediaData
    let adharCardBackSide: MediaData
    let panCard: MediaData
    let ownerPhoto: MediaData
    let uuid: String
    let emailOtp: String?
    let mobileOtp: String?
}

struct PharmacyDetail {
    let apiToken: String
    let userId: Int
    let pharmacyName: String
    let latitude: String
    let longitude: String
    let address: String
    let country: String
    let state: String
    let city: String
    let pincode: String
    let internalDeliveryRange: String
    let minDiscount: String
    let maxDiscount: String
    let discountTermsAndCond: String
    let shopOpenTime: String
    let shopCloseTime: String
    let lunchOpenTime: String
    let lunchCloseTime: String
    let sundayOpenTime: String
    let sundayCloseTime: String
    let sundayLunchOpenTime: String
    let sundayLunchCloseTime: String
}

struct FilterDataModel {
    let title: String
    let isSelected: Bool
}
