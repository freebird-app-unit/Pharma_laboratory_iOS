//
//  CreateAccountVC.swift
//  My Health Chart-Pharmacy
//
//  Created by Jat42 on 28/09/21.
//

import UIKit

extension RegisterDetailVC {
    static func instantiate() -> RegisterDetailVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: RegisterDetailVC.self)) as! RegisterDetailVC
    }
}

class RegisterDetailVC: UIViewController {
    
    enum DocumentType {
        case partnerShipDeed
        case drugLicence
        case adharCard
        case panCard
        case ownerPhoto
    }

    @IBOutlet var uiViewToolBar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    
    @IBOutlet var btnFirmType: [UIButton]!
    
    @IBOutlet var textfieldFullName: AppTextfield!
    @IBOutlet var textfieldPartnerName: AppTextfield!
    
    @IBOutlet var stackViewPartnerShipDeed: UIStackView!
    
    @IBOutlet var uiViewUploadPartnerShipDeedBorder: UIView!
    
    @IBOutlet var collectionViewPartnershipDeed: UICollectionView!
    
    @IBOutlet var textfieldEmail: AppTextfield!
    @IBOutlet var textfieldOwnerMobileNo: AppTextfield!
    @IBOutlet var textfieldServiceMobileNo: AppTextfield!
    @IBOutlet var textfieldManagerMobileNo: AppTextfield!
    @IBOutlet var textfieldLicenceNo: AppTextfield!
    @IBOutlet var textfieldValidUptoYear: AppTextfield!
    @IBOutlet var textfieldPassword: AppTextfield!
    @IBOutlet var textfieldConfPassword: AppTextfield!
    
    @IBOutlet var btnEyePassword: UIButton!
    @IBOutlet var btnEyeConfPassword: UIButton!
    
    @IBOutlet var uiViewUploadDrugLicenceBorder: UIView!
    @IBOutlet var uiViewUploadFrontAdharCardBorder: UIView!
    @IBOutlet var uiViewUploadBackAdharCardBorder: UIView!
    @IBOutlet var uiViewUploadPanCardBorder: UIView!
    @IBOutlet var uiViewOwnerProfileBorder: UIView!
    
    @IBOutlet var collectionViewDrugLicence: UICollectionView!
    
    @IBOutlet var uiViewAdharFrontContainer: UIView!
    @IBOutlet var uiViewFrontAdharImageContainer: UIView!
    @IBOutlet var imageViewAdharFront: UIImageView!
    
    @IBOutlet var uiViewAdharBackContainer: UIView!
    @IBOutlet var uiViewBackAdharImageContainer: UIView!
    @IBOutlet var imageViewAdharBack: UIImageView!
    
    @IBOutlet var uiViewPanCardImageContainer: UIView!
    @IBOutlet var imageViewPanCard: UIImageView!
    
    @IBOutlet var uiViewOwnerImageContainer: UIView!
    @IBOutlet var imageViewOwner: UIImageView!
    
    var selectedAdharButton = 0
    
    var adharFrontData: MediaData?
    var adharBackData: MediaData?
    var panCardData: MediaData?
    var ownerData: MediaData?
    
    private var isNewPwdHidden = true
    private var isConfPwdHidden = true
    
    var docTypeChoose: DocumentType = .drugLicence
    
    var partnershipDeedDataSource:[MediaData] = []
    var drugLicenceDataSource:[MediaData] = []
    
    var selectedFirmType = 0
    
    private let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupDelegates()
        setUpDropDown()
        
        uiViewUploadPartnerShipDeedBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        uiViewUploadDrugLicenceBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        uiViewUploadFrontAdharCardBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        uiViewUploadBackAdharCardBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        uiViewUploadPanCardBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        uiViewOwnerProfileBorder.addLineDashedStroke(pattern: [2,2], radius: 8, color: .appColor.appPrimaryColor)
        
        registerCollectioViewCell()
    }
    
    private func setupDelegates() {
        uiViewToolBar.delegate = self
        labelTitle.font = .appFont.medium(ofSize: 22)
        labelSubTitle.font = .appFont.regular(ofSize: 14)
        textfieldFullName.delegate = self
        textfieldPartnerName.delegate = self
        textfieldEmail.delegate = self
        textfieldOwnerMobileNo.delegate = self
        textfieldServiceMobileNo.delegate = self
        textfieldManagerMobileNo.delegate = self
        textfieldLicenceNo.delegate = self
        textfieldValidUptoYear.delegate = self
        textfieldPassword.delegate = self
        textfieldConfPassword.delegate = self
    }
    
    private func registerCollectioViewCell() {
        collectionViewPartnershipDeed.register(
            MediaCollectionCell.loadNib(),
            forCellWithReuseIdentifier: MediaCollectionCell.idetifire()
        )
        collectionViewDrugLicence.register(
            MediaCollectionCell.loadNib(),
            forCellWithReuseIdentifier: MediaCollectionCell.idetifire()
        )
        setFlowLayout()
    }
    
    private func setFlowLayout() {
        let partnerShipDeedLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        partnerShipDeedLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        partnerShipDeedLayout.minimumInteritemSpacing = 0
        partnerShipDeedLayout.minimumLineSpacing = 16
        partnerShipDeedLayout.scrollDirection = .horizontal
        
        collectionViewPartnershipDeed.collectionViewLayout = partnerShipDeedLayout
        
        let drugLicenceLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        partnerShipDeedLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        partnerShipDeedLayout.minimumInteritemSpacing = 0
        partnerShipDeedLayout.minimumLineSpacing = 16
        partnerShipDeedLayout.scrollDirection = .horizontal

        collectionViewDrugLicence.collectionViewLayout = drugLicenceLayout
    }
    
    private func setUpDropDown() {
        dropDown.anchorView = textfieldValidUptoYear
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 4
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        
        dropDown.selectionAction = { [self] (index, title) in
            textfieldValidUptoYear.text = title
        }
    }
    
    @IBAction func btnFirmTypePressed(_ sender: UIButton) {
        
        selectedFirmType = sender.tag
        
        for btns in btnFirmType {
            if btns.tag == selectedFirmType {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_blue"), for: .normal)
            } else {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_grey"), for: .normal)
            }
        }
        
        if selectedFirmType == 0 {
            stackViewPartnerShipDeed.isHidden = true
        } else {
            stackViewPartnerShipDeed.isHidden = false
        }
    }
    
    @IBAction func btnUploadPartnerShipDeedPressed(_ sender: UIButton) {
        docTypeChoose = .partnerShipDeed
        
        var isAllowedPDF = true
        
        for mediaData in partnershipDeedDataSource {
            if mediaData.fileType == .jpeg || mediaData.fileType == .jpg || mediaData.fileType == .png {
                isAllowedPDF = false
                break
            }
        }
        
        MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: isAllowedPDF)
    }
    
    @IBAction func btnValidUptoYearPressed(_ sender: UIButton) {
        dropDown.dataSource = [DateHelper.shared.getNextMonthYear()]
        dropDown.show()
    }
    
    @IBAction func btnEyePressed(_ sender: UIButton) {
        if sender == btnEyePassword {
            isNewPwdHidden.toggle()
            textfieldPassword.isSecureTextEntry = isNewPwdHidden
            textfieldPassword.rightImage = isNewPwdHidden ? #imageLiteral(resourceName: "ic_eye_closed") : #imageLiteral(resourceName: "ic_eye_open")
        } else {
            isConfPwdHidden.toggle()
            textfieldConfPassword.isSecureTextEntry = isConfPwdHidden
            textfieldConfPassword.rightImage = isConfPwdHidden ? #imageLiteral(resourceName: "ic_eye_closed") : #imageLiteral(resourceName: "ic_eye_open")
        }
    }
    
    @IBAction func btnUploadDrugLicencePressed(_ sender: UIButton) {
        
        docTypeChoose = .drugLicence
        
        var isAllowedPDF = true
        
        for mediaData in drugLicenceDataSource {
            if mediaData.fileType == .jpeg || mediaData.fileType == .jpg || mediaData.fileType == .png {
                isAllowedPDF = false
                break
            }
        }
        
        MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: isAllowedPDF)
        
    }
    
    @IBAction func btnUploadAdharPressed(_ sender: UIButton) {
        docTypeChoose = .adharCard
        selectedAdharButton = sender.tag
        
        if selectedAdharButton == 0 {
            
            var isPdfAllow = false
            
            if adharBackData == nil {
                isPdfAllow = true
            }
        
            MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: isPdfAllow)
        } else {
            
            var isPdfAllow = false
            
            if adharFrontData == nil {
                isPdfAllow = true
            }
            
            MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: isPdfAllow)
        }
    }
    
    @IBAction func btnAdharFullScreenViewPressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            openMediaInFullScreen(media: adharFrontData)
        } else {
            openMediaInFullScreen(media: adharBackData)
        }
    }
    
    @IBAction func btnAdharCancelPressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            adharFrontData = nil
            imageViewAdharFront.image = nil
            uiViewFrontAdharImageContainer.isHidden = true
            uiViewUploadFrontAdharCardBorder.isHidden = false
            uiViewAdharBackContainer.isHidden = false
            
        } else {
            adharBackData = nil
            imageViewAdharBack.image = nil
            uiViewBackAdharImageContainer.isHidden = true
            uiViewUploadBackAdharCardBorder.isHidden = false
            uiViewAdharFrontContainer.isHidden = false
        }
        
    }
    
    @IBAction func btnUploadPanCardPressed(_ sender: UIButton) {
        docTypeChoose = .panCard
        MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: true)
    }
    
    @IBAction func btnPanCardFullScreenPressed(_ sender: UIButton) {
        openMediaInFullScreen(media: panCardData)
    }
    
    @IBAction func btnPanCardCancelPressed(_ sender: UIButton) {
        panCardData = nil
        imageViewPanCard.image = nil
        uiViewPanCardImageContainer.isHidden = true
        uiViewUploadPanCardBorder.isHidden = false
    }
    
    @IBAction func btnUploadOwnerImagePressed(_ sender: UIButton) {
        docTypeChoose = .ownerPhoto
        MediaPicker.shared.chooseOptionForMediaType(delegate: self, isAllowedPdf: false)
    }
    
    @IBAction func btnOwnerImageFullScreenPressed(_ sender: UIButton) {
        openMediaInFullScreen(media: ownerData)
    }
    
    @IBAction func btnOwnerImageCancelPressed(_ sender: UIButton) {
        ownerData = nil
        imageViewOwner.image = nil
        uiViewOwnerImageContainer.isHidden = true
        uiViewOwnerProfileBorder.isHidden = false
    }
    
    @IBAction func btnNextPressed(_ sender: UIButton) {
        let vc = LaboratoryDetailVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        //validateForm()
        //navigateToOtpVerification()
    }
    
    func openMediaInFullScreen(media: MediaData?) {
        
        guard media != nil else { return }
        
        if media!.fileType == .pdf && media!.pdfData != nil {
            let vc = PDFViewerVC.instantiate()
            vc.localData = media!.pdfData
            present(vc, animated: true, completion: nil)
        } else if media!.image != nil {
            let vc = FullScreenVC.instantiate()
            vc.image = media!.image!
            present(vc, animated: true, completion: nil)
        }
        
    }

}



