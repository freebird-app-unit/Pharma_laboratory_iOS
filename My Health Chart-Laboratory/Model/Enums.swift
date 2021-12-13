//
//  Enums.swift
//  My Pharmacy
//
//  Created by iOS Dev on 31/12/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

enum AppMode {
    case development
    case production
}

enum ScreenType {
    case login
    case resetPassword
    case changePassword
    case deliveryCharge
    case callHistory
    case upcomingOrder
    case notification
    case acceptOrder
    case outForDelivery
    case completeOrder
    case returnOrderPaid
    case returnOrderFree
    case cancelOrder
    case rejectedOrder
    case assignOrder
    case reassignOrder
}

enum UserType {
    case admin
    case tester
    case collector
}

enum OrderStatus: String {
    
    case upcoming
    case accepted
    case packed
    case complete
    case returned
    case cancel
    case rejected
    
    var serverString: String {
        switch self {
            
            case .upcoming:
                return "new"
            case .accepted:
                return "accept"
            case .packed:
                return "assign"
            case .complete:
                return "complete"
            case .returned:
                return "incomplete"
            case .cancel:
                return "cancel"
            case .rejected:
                return "reject"
        }
    }
}
