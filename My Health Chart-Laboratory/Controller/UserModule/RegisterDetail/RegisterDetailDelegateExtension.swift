//
//  CreateAccountTextFieldDelegateExtension.swift
//  My Health Chart-Pharmacy
//
//  Created by Jat42 on 29/09/21.
//

import UIKit

extension RegisterDetailVC {
    
//    func validateForm() {
//
//        var isValidName = false
//        var isValidPartnerName = false
//        var isValidEmail = false
//        var isValidOwnerMobileNo = false
//        var isValidServiceMobileNo = false
//        var isValidManagerMobileNo = false
//        var isValidLicenceNo = false
//        var isValidUpToYearDate = false
//        var isValidPwd = false
//        var isValidConfPwd = false
//
//        if textfieldFullName.text!.trimmingCharacters(in: .whitespaces).isEmpty {
//            textfieldFullName.errorMessage = Strings.emptyFullNameError
//        } else if textfieldFullName.text!.count < Validation.minNameLength {
//            textfieldFullName.errorMessage = Strings.invalidNameError(length: Validation.minNameLength)
//        } else {
//            textfieldFullName.errorMessage = nil
//            isValidName = true
//        }
//
//        if selectedFirmType != 0 {
//            if textfieldPartnerName.text!.trimmingCharacters(in: .whitespaces).isEmpty {
//                textfieldPartnerName.errorMessage = Strings.emptyPartnerNameError
//            } else if textfieldPartnerName.text!.count < Validation.minNameLength {
//                textfieldPartnerName.errorMessage = Strings.invalidPartnerNameError(length: Validation.minNameLength)
//            } else {
//                textfieldPartnerName.errorMessage = nil
//                isValidPartnerName = true
//            }
//        }
//
//        if textfieldEmail.text!.trimmingCharacters(in: .whitespaces).isEmpty {
//            textfieldEmail.errorMessage = Strings.emptyEmailError
//        } else if !Validation().isValidEmail(testStr: textfieldEmail.text!) {
//            textfieldEmail.errorMessage = Strings.invalidEmailError
//        } else {
//            textfieldEmail.errorMessage = nil
//            isValidEmail = true
//        }
//
//        if textfieldOwnerMobileNo.text!.isEmpty {
//            textfieldOwnerMobileNo.errorMessage = Strings.emptyOwnerPhoneError
//        } else if textfieldOwnerMobileNo.text!.count < Validation.maxMobileNoLength {
//            textfieldOwnerMobileNo.errorMessage = Strings.invalidOwnerPhoneLengthError(
//                length: Validation.maxMobileNoLength
//            )
//        } else {
//            textfieldOwnerMobileNo.errorMessage = nil
//            isValidOwnerMobileNo = true
//        }
//
//        if textfieldServiceMobileNo.text!.isEmpty {
//            textfieldServiceMobileNo.errorMessage = Strings.emptyServicePhoneError
//        } else if textfieldServiceMobileNo.text!.count < Validation.maxMobileNoLength {
//            textfieldServiceMobileNo.errorMessage = Strings.invalidServicePhoneLengthError(
//                length: Validation.maxMobileNoLength
//            )
//        } else {
//            textfieldServiceMobileNo.errorMessage = nil
//            isValidServiceMobileNo = true
//        }
//
//        if textfieldManagerMobileNo.text!.isEmpty {
//            textfieldManagerMobileNo.errorMessage = Strings.emptyManagerPhoneError
//        } else if textfieldManagerMobileNo.text!.count < Validation.maxMobileNoLength {
//            textfieldManagerMobileNo.errorMessage = Strings.invalidManagerPhoneLengthError(
//                length: Validation.maxMobileNoLength
//            )
//        } else {
//            textfieldManagerMobileNo.errorMessage = nil
//            isValidManagerMobileNo = true
//        }
//
//        if textfieldLicenceNo.text!.isEmpty {
//            textfieldLicenceNo.errorMessage = Strings.emptyDrugLicenceNo
//        } else {
//            textfieldLicenceNo.errorMessage = nil
//            isValidLicenceNo = true
//        }
//
//        if textfieldValidUptoYear.text!.isEmpty {
//            textfieldValidUptoYear.errorMessage = Strings.emptyValidUpToYear
//        } else {
//            textfieldValidUptoYear.errorMessage = nil
//            isValidUpToYearDate = true
//        }
//
//        if textfieldPassword.text!.isEmpty {
//            textfieldPassword.errorMessage = Strings.emptyPasswordError
//        } else if textfieldPassword.text!.count < Validation.minPwdLength {
//            textfieldPassword.errorMessage = Strings.inValidPasswordError(length: Validation.minPwdLength)
//        } else {
//            textfieldPassword.errorMessage = nil
//            isValidPwd = true
//        }
//
//        if textfieldConfPassword.text!.isEmpty {
//            textfieldConfPassword.errorMessage = Strings.emptyConfPasswordError
//        } else if textfieldPassword.text != textfieldConfPassword.text {
//            textfieldConfPassword.errorMessage = Strings.inValidConfirmPasswordError
//        } else {
//            textfieldConfPassword.errorMessage = nil
//            isValidConfPwd = true
//        }
//
//        if isValidName &&
//            isValidEmail &&
//            isValidOwnerMobileNo &&
//            isValidServiceMobileNo &&
//            isValidManagerMobileNo &&
//            isValidLicenceNo &&
//            isValidUpToYearDate &&
//            isValidPwd &&
//            isValidConfPwd {
//
//            if selectedFirmType == 1 {
//                if isValidPartnerName {
//                    isValidDocuments()
//                }
//            } else {
//                isValidDocuments()
//            }
//        }
//    }
//
//    func isValidDocuments() {
//
//        if selectedFirmType == 1 {
//            if partnershipDeedDataSource.isEmpty {
//                AlertHelper.shared.showAlert(message: Strings.uploadPartnerShipDeed)
//                return
//            }
//        }
//
//        if drugLicenceDataSource.isEmpty {
//            AlertHelper.shared.showAlert(message: Strings.uploadDrugLicence)
//        } else if adharFrontData == nil && adharBackData == nil {
//            AlertHelper.shared.showAlert(message: Strings.uploadAdharCard)
//        } else if adharFrontData == nil {
//            AlertHelper.shared.showAlert(message: Strings.uploadFrontAdharCard)
//        } else if adharBackData == nil {
//            AlertHelper.shared.showAlert(message: Strings.uploadBackAdharCard)
//        } else if panCardData == nil {
//            AlertHelper.shared.showAlert(message: Strings.uploadPanCard)
//        } else if ownerData == nil {
//            AlertHelper.shared.showAlert(message: Strings.uploadOwnerPhoto)
//        } else {
//            if Networking.isConnectedToInternet() {
//                verifyOtp()
//            } else {
//                AlertHelper.shared.showAlert(message: Strings.noNetworkError)
//            }
//
//        }
//
//    }
    
}

extension RegisterDetailVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == textfieldPartnerName || textField == textfieldFullName {
            
            return Validation.shouldAllowTyping(
                textField,
                range: range,
                string: string,
                maxRange: Validation.maxNameLength
            )
            
        } else if textField == textfieldEmail {
            
            return Validation.shouldAllowTyping(
                textField,
                range: range,
                string: string,
                maxRange: Validation.maxEmailLength
            )
            
        } else if textField == textfieldOwnerMobileNo ||
                  textField == textfieldServiceMobileNo ||
                  textField == textfieldManagerMobileNo {
            
            return Validation.shouldAllowTyping(
                textField,
                range: range,
                string: string,
                maxRange: Validation.maxMobileNoLength
            ) &&
            (
                string.rangeOfCharacter(
                    from: Validation.mobileNoInvalidChars
                ) == nil)
            
        } else if textField == textfieldLicenceNo {
            
            return Validation.shouldAllowTyping(
                textField,
                range: range,
                string: string,
                maxRange: Validation.maxAllowedChares
            ) && (
                string.rangeOfCharacter(
                    from: Validation.invalidAlphaNumeric
                ) == nil)
            
        } else if textField == textfieldPassword || textField == textfieldConfPassword {
            
            return Validation.shouldAllowTyping(
                textField,
                range: range,
                string: string,
                maxRange: Validation.maxPwdLength
            )
        }
        return true
    }
    
}

extension RegisterDetailVC: ToolBarDelegate, MediaPickerDelegate {
    
    func btnBackPressed() {
        let vc = navigationController!.viewControllers.filter { $0 is CreateAccountVC }.first!
        navigationController!.popToViewController(vc, animated: true)
    }
    
    func mediaPicked(media: MediaData) {
        
        switch docTypeChoose {
            
            case .partnerShipDeed:
                
                if media.fileType == .pdf {
                    uiViewUploadPartnerShipDeedBorder.isHidden = true
                }
                partnershipDeedDataSource.append(media)
                collectionViewPartnershipDeed.reloadData()
                
            case .drugLicence:
                
                if media.fileType == .pdf {
                    uiViewUploadDrugLicenceBorder.isHidden = true
                }
                drugLicenceDataSource.append(media)
                collectionViewDrugLicence.reloadData()
                
            case .adharCard:
                
                if selectedAdharButton == 0 {
                    
                    adharFrontData = media
                    uiViewFrontAdharImageContainer.isHidden = false
                    uiViewUploadFrontAdharCardBorder.isHidden = true
                    
                    if media.fileType == .pdf {
                        imageViewAdharFront.image = #imageLiteral(resourceName: "ic_pdf")
                        uiViewAdharBackContainer.isHidden = true
                    } else {
                        imageViewAdharFront.image = media.image
                    }
                    
                } else {
                    
                    adharBackData = media
                    uiViewBackAdharImageContainer.isHidden = false
                    uiViewUploadBackAdharCardBorder.isHidden = true
                    
                    if media.fileType == .pdf {
                        imageViewAdharBack.image = #imageLiteral(resourceName: "ic_pdf")
                        uiViewAdharFrontContainer.isHidden = true
                    } else {
                        imageViewAdharBack.image = media.image
                    }
                    
                }
                
            case .panCard:
                
                panCardData = media
                uiViewPanCardImageContainer.isHidden = false
                uiViewUploadPanCardBorder.isHidden = true
                
                if media.fileType == .pdf {
                    imageViewPanCard.image = #imageLiteral(resourceName: "ic_pdf")
                } else {
                    imageViewPanCard.image = media.image
                }
                
            case .ownerPhoto:
                
                ownerData = media
                uiViewOwnerImageContainer.isHidden = false
                uiViewOwnerProfileBorder.isHidden = true
                
                imageViewOwner.image = media.image
                
        }
    }
    
    func verifyOtp() {
     
        let param = [
            Parameter.email: textfieldEmail.text!,
            Parameter.mobileNo: textfieldOwnerMobileNo.text!
        ]
        
        Networking.request(
            url: Urls.registerOtp,
            method: .post,
            headers: nil,
            defaultHeader: false,
            param: param,
            fileData: nil,
            isActivityIndicatorActive: true,
            isActivityIndicatorUserInteractionAllow: false
        ) { [self] response in
                
            switch response {
                    
                case .success(let data):
                    
                    guard let jsonData = data else {
                        AlertHelper.shared.showAlert(message: CustomError.missinJsonData.localizedDescription)
                        return
                    }
                    
                    let registerResponse = NetworkHelper.decodeJsonData(data: jsonData, decodeWith: RegisterWithOtpResponse.self)
                    
                    guard let rsResponse = registerResponse else {
                        AlertHelper.shared.showAlert(message: CustomError.missinJsonData.localizedDescription)
                        return
                    }
                    
                    if rsResponse.status == StatusCode.success.rawValue {
                        
                        let registrationdata = RegisterationModel(
                            firmType: selectedFirmType,
                            fullName: textfieldFullName.text!,
                            partnerName: textfieldPartnerName.text!,
                            email: textfieldEmail.text!,
                            pharmacyOwnerMobileNumber: textfieldOwnerMobileNo.text!,
                            pharmacyServiceMobileNumber: textfieldServiceMobileNo.text!,
                            pharmacyManagerMobileNumber: textfieldManagerMobileNo.text!,
                            drugLicenceNumber: textfieldLicenceNo.text!,
                            validUpToYear: textfieldValidUptoYear.text!,
                            password: textfieldPassword.text!,
                            partnerShipDeed: partnershipDeedDataSource,
                            drugLicence: drugLicenceDataSource,
                            adharCardFrontSide: adharFrontData!,
                            adharCardBackSide: adharBackData!,
                            panCard: panCardData!,
                            ownerPhoto: ownerData!,
                            uuid: rsResponse.data!.uuid!,
                            emailOtp: rsResponse.data?.emailOtp,
                            mobileOtp: rsResponse.data?.mobileOtp
                        )
                        
                        AlertHelper.shared.showToast(message: rsResponse.message!, duration: .normal) { [self] in
                            navigateToOtpVerification(data: registrationdata)
                        }
                        
                    } else {
                        AlertHelper.shared.showAlert(message: rsResponse.message!)
                    }
                    
                case .failure(let error):
                    AlertHelper.shared.showAlert(message: error.localizedDescription)
                    Logger.e("File: \(#file)\nMethod: \(#function)\nline: \(#line)-> error:- \(error.localizedDescription)")
            }
                
        }
        
    }
    
    func navigateToOtpVerification(data: RegisterationModel) {
//        let vc = CreateAccOtpVC.instantiate()
//        vc.registrationData = data
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

