//
//  NetworkManager.swift
//  My Pharmacy
//
//  Created by Jat42 on 17/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import Foundation
import Alamofire

class Networking: NSObject {
    
    var alertController: UIViewController?
    
    static func request(
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        defaultHeader: Bool = false,
        param: [String:Any]?,
        fileData: [FileData]?,
        isActivityIndicatorActive: Bool = true,
        isActivityIndicatorUserInteractionAllow: Bool,
        Completion completion: @escaping (Swift.Result<Data?,Error>) -> Void
    ) {
        
        if !Networking.isConnectedToInternet() {
            AlertHelper.shared.showAlert(message: Strings.noNetworkError)
            return
        }
        
        if let _ = fileData {
            
            if fileData!.count > 1 {
                
                makeNetworkRequest(
                    url: url,
                    method: method,
                    headers: headers,
                    defaultHeader: defaultHeader,
                    param: param,
                    fileData: fileData!,
                    isActivityIndicatorActive: isActivityIndicatorActive,
                    isActivityIndicatorUserInteractionAllow: isActivityIndicatorUserInteractionAllow) { response in
                    
                    switch response {
                        case .success(let data):
                            completion(.success(data))
                        case .failure(let error):
                            completion(.failure(error))
                    }
                }
                
                
            } else {
                
                makeNetworkRequest(
                    url: url,
                    method: method,
                    headers: headers,
                    defaultHeader: defaultHeader,
                    param: param,
                    fileData: fileData!.first!,
                    isActivityIndicatorActive: isActivityIndicatorActive,
                    isActivityIndicatorUserInteractionAllow: isActivityIndicatorUserInteractionAllow) { response in
                    
                    switch response {
                        case .success(let data):
                            completion(.success(data))
                        case .failure(let error):
                            completion(.failure(error))
                    }
                }
            }
            
        } else {
            
            makeNetworkRequest(
                url: url,
                method: method,
                headers: headers,
                defaultHeader: defaultHeader,
                param: param,
                isActivityIndicatorActive: isActivityIndicatorActive,
                isActivityIndicatorUserInteractionAllow: isActivityIndicatorUserInteractionAllow) { response in
                
                switch response {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        }
    }
    
    
    /// Multipart file upload method
    private static func makeNetworkRequest(
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        defaultHeader: Bool = false,
        param: [String:Any]?,
        fileData: FileData,
        isActivityIndicatorActive: Bool = true,
        isActivityIndicatorUserInteractionAllow: Bool,
        Completion completion: @escaping (Swift.Result<Data?,Error>) -> Void
    ) {
        
        if isActivityIndicatorActive {
            LoadingIndicator.showLoadingView(isUserInteractionAllow: isActivityIndicatorUserInteractionAllow)
        }
        
        var token = ""
        
        let header: HTTPHeaders?
        
        if headers != nil || defaultHeader {
            if let tkn = UserDefaultHelper.shared.getUserData(key: UserDefaultHelper.UserDefaultKeys.apiToken) as? String {
                token = "Bearer \(tkn)"
            }
        }
        
        if defaultHeader {
            header = [
                HTTPHeaderConstant.authorization: token,
                HTTPHeaderConstant.accept: HTTPHeaderConstant.jsonContentType
            ]
        } else {
            header = headers
        }
        
        Logger.print("URL::== \(url) \n Method::== \(method.rawValue)")
        Logger.print("========================================================")
        Logger.print("Header::== \(header ?? [:])")
        Logger.print("========================================================")
        Logger.print("Params::== \(param ?? [:])")
        Logger.print("========================================================")
        
        var object : Any?
        var encryptedParams : [String : Any]?
        
        if let _ = param {
            object = NetworkHelper.getJSONString(object: param!)!
            encryptedParams = ["data": Encryption.shared.encryptData(data: object as! String) ?? ""] as [String:Any]
            
            Logger.print("Encrypted Params::== \(encryptedParams!)")
            Logger.print("========================================================")
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            for (key, value) in encryptedParams! {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            multipartFormData.append(fileData.data, withName: fileData.key, fileName: "\(Date().timeIntervalSince1970).\(fileData.mimeType.fileExtension)", mimeType: fileData.mimeType.rawValue)
            
        }, usingThreshold: UInt64.init(),
        to: url,
        method: method,
        headers: header,
        encodingCompletion: {
            
            encodingResult in
            
            switch encodingResult {
                
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        
                        let statusCode = response.response?.statusCode ?? 501
                        
                        Logger.print("Header Status Code:: \(statusCode)")
                        
                        if statusCode == StatusCode.internalServerError.rawValue {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e(String(data: response.data!, encoding: .utf8)!)
                            
                            completion(.failure(CustomError.serverError))
                            return
                        }
                        
                        guard let jsonData = response.data else {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        let encryptedString = String(data: jsonData, encoding: .utf8)
                        
                        Logger.print("Encrypted response:=========:: \(encryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedString = Encryption.shared.decryptData(data: encryptedString!)
                        
                        Logger.print("Decrypted Response:-=== \(decryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedJsonData = decryptedString!.data(using: .utf8)
                        
                        do {
                            
                            let data = try JSONDecoder().decode(CommonApiResponse.self, from: decryptedJsonData!)
                            
                            if data.status == StatusCode.unauthorised.rawValue {
                            
                                if isActivityIndicatorActive {
                                    LoadingIndicator.hideLoadingView()
                                }
                                
                                AlertHelper.shared.showAlert(
                                    message: data.message!) { action in
                                    
                                    Helper.shared.setLogout()
                                }
                                return
                            }
                            
                        } catch  {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e("CommonApiResponse parsing error:- \(error)")
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        if isActivityIndicatorActive {
                            LoadingIndicator.hideLoadingView()
                        }
                        
                        completion(.success(decryptedJsonData!))
                        
                    }
                    
                case .failure(let error):
                    
                    if isActivityIndicatorActive {
                        LoadingIndicator.hideLoadingView()
                    }
                    
                    Logger.e("Networking error:- \(error)")
                    completion(.failure(CustomError.serverError))
            }
        })
    }
    
    /// Multipart file array upload method
    private static func makeNetworkRequest(
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        defaultHeader: Bool = false,
        param: [String:Any]?,
        fileData: [FileData],
        isActivityIndicatorActive: Bool = true,
        isActivityIndicatorUserInteractionAllow: Bool,
        Completion completion: @escaping (Swift.Result<Data?,Error>) -> Void
    ) {
        
        if isActivityIndicatorActive {
            LoadingIndicator.showLoadingView(isUserInteractionAllow: isActivityIndicatorUserInteractionAllow)
        }
        
        var token = ""
        
        let header: HTTPHeaders?
        
        if headers != nil || defaultHeader {
            if let tkn = UserDefaultHelper.shared.getUserData(key: UserDefaultHelper.UserDefaultKeys.apiToken) as? String {
                token = "Bearer \(tkn)"
            }
        }
        
        if defaultHeader {
            header = [
                HTTPHeaderConstant.authorization: token,
                HTTPHeaderConstant.accept: HTTPHeaderConstant.jsonContentType
            ]
        } else {
            header = headers
        }
        
        Logger.print("URL::== \(url) \n Method::== \(method.rawValue)")
        Logger.print("========================================================")
        Logger.print("Header::== \(header ?? [:])")
        Logger.print("========================================================")
        Logger.print("Params::== \(param ?? [:])")
        Logger.print("========================================================")
        
        var object : Any?
        var encryptedParams : [String : Any]?
        
        if let _ = param {
            object = NetworkHelper.getJSONString(object: param!)!
            encryptedParams = ["data": Encryption.shared.encryptData(data: object as! String) ?? ""] as [String:Any]
            
            Logger.print("Encrypted Params::== \(encryptedParams!)")
            Logger.print("========================================================")
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            for (key, value) in encryptedParams! {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            for file in fileData {
                multipartFormData.append(file.data, withName: "\(file.key)[]", fileName: "\(Date().timeIntervalSince1970).\(file.mimeType.fileExtension)", mimeType: file.mimeType.rawValue)
            }
        
        }, usingThreshold: UInt64.init(),
        to: url,
        method: method,
        headers: header,
        encodingCompletion: {
            
            encodingResult in
            
            switch encodingResult {
                
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        
                        let statusCode = response.response?.statusCode ?? 501
                        
                        Logger.print("Header Status Code:: \(statusCode)")
                        
                        if statusCode == StatusCode.internalServerError.rawValue {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e(String(data: response.data!, encoding: .utf8)!)
                            
                            completion(.failure(CustomError.serverError))
                            return
                        }
                        
                        guard let jsonData = response.data else {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        let encryptedString = String(data: jsonData, encoding: .utf8)
                        
                        Logger.print("Encrypted response:=========:: \(encryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedString = Encryption.shared.decryptData(data: encryptedString!)
                        
                        Logger.print("Decrypted Response:-=== \(decryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedJsonData = decryptedString!.data(using: .utf8)
                        
                        do {
                            
                            let data = try JSONDecoder().decode(CommonApiResponse.self, from: decryptedJsonData!)
                            
                            if data.status == StatusCode.unauthorised.rawValue {
                                
                                if isActivityIndicatorActive {
                                    LoadingIndicator.hideLoadingView()
                                }
                                
                                AlertHelper.shared.showAlert(
                                    message: data.message!) { action in
                                    
                                    Helper.shared.setLogout()
                                }
                                return
                            }
                            
                        } catch  {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e("CommonApiResponse parsing error:- \(error)")
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        if isActivityIndicatorActive {
                            LoadingIndicator.hideLoadingView()
                        }
                        
                        completion(.success(decryptedJsonData!))
                        
                    }
                    
                case .failure(let error):
                    
                    if isActivityIndicatorActive {
                        LoadingIndicator.hideLoadingView()
                    }
                    
                    Logger.e("Networking error:- \(error)")
                    completion(.failure(CustomError.serverError))
            }
        })
    }
    
    
    /// Regular network request method
    private static func makeNetworkRequest(
        
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        defaultHeader: Bool = false,
        param: [String : Any]?,
        isActivityIndicatorActive: Bool = true,
        isActivityIndicatorUserInteractionAllow: Bool,
        Completion completion: @escaping (Swift.Result<Data?,Error>) -> Void
    ) {
        
        if isActivityIndicatorActive {
            LoadingIndicator.showLoadingView(isUserInteractionAllow: isActivityIndicatorUserInteractionAllow)
        }
        
        var token = ""
        
        let header: HTTPHeaders?
        
        if headers != nil || defaultHeader {
            if let tkn = UserDefaultHelper.shared.getUserData(key: UserDefaultHelper.UserDefaultKeys.apiToken) as? String {
                token = "Bearer \(tkn)"
            }
        }
        
        if defaultHeader {
            header = [
                HTTPHeaderConstant.authorization: token,
                HTTPHeaderConstant.accept: HTTPHeaderConstant.jsonContentType
            ]
        } else {
            header = headers
        }
        
        Logger.print("URL::== \(url) \n Method::== \(method.rawValue)")
        Logger.print("========================================================")
        Logger.print("Header::== \(header ?? [:])")
        Logger.print("========================================================")
        Logger.print("Params::== \(param ?? [:])")
        Logger.print("========================================================")
        
        var object : Any?
        var encryptedParams : [String : Any]?
        
        if let _ = param {
            object = NetworkHelper.getJSONString(object: param!)!
            encryptedParams = ["data": Encryption.shared.encryptData(data: object as! String) ?? ""] as [String:Any]
            
            Logger.print("Encrypted Params::== \(encryptedParams!)")
            Logger.print("========================================================")
        }
        
        Alamofire.request(
            
            url,
            method: method,
            parameters: encryptedParams,
            encoding: URLEncoding.default,
            headers: header).responseData { (responseData) in
            
                switch responseData.result {
                    
                    case .success(_):
                        
                        let statusCode = responseData.response?.statusCode ?? 501
                        
                        Logger.print("Header Status Code:: \(statusCode)")
                        
                        if statusCode == StatusCode.internalServerError.rawValue {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e(String(data: responseData.data!, encoding: .utf8)!)
                            
                            completion(.failure(CustomError.serverError))
                            
                            return
                        }
                        
                        guard let jsonData = responseData.data else {
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        let encryptedString = String(data: jsonData, encoding: .utf8)
                        
                        Logger.print("Encrypted response:=========:: \(encryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedString = Encryption.shared.decryptData(data: encryptedString!)
                        
                        Logger.print("Decrypted Response:-=== \(decryptedString ?? CustomError.missinJsonData.localizedDescription)")
                        Logger.print("========================================================")
                        
                        let decryptedJsonData = decryptedString!.data(using: .utf8)
                        
                        do {
                            
                            let data = try JSONDecoder().decode(CommonApiResponse.self, from: decryptedJsonData!)
                            
                            if data.status == StatusCode.unauthorised.rawValue {
                                
                                if isActivityIndicatorActive {
                                    LoadingIndicator.hideLoadingView()
                                }
                                
                                AlertHelper.shared.showAlert(
                                    message: data.message!) { action in
                                    
                                    Helper.shared.setLogout()
                                }
                                return
                            }
                            
                        } catch  {
                            
                            if isActivityIndicatorActive {
                                LoadingIndicator.hideLoadingView()
                            }
                            
                            Logger.e("CommonApiResponse parsing error:- \(error)")
                            completion(.failure(CustomError.missinJsonData))
                            return
                        }
                        
                        if isActivityIndicatorActive {
                            LoadingIndicator.hideLoadingView()
                        }
                        
                        completion(.success(decryptedJsonData!))
                        
                    case .failure(let error):
                        
                        if isActivityIndicatorActive {
                            LoadingIndicator.hideLoadingView()
                        }
                        
                        Logger.e("Networking error:- \(error)")
                        completion(.failure(CustomError.serverError))
                }
            }
    }
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
}
