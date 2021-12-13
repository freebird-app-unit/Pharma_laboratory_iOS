//
//  MyTeamCreateVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension MyTeamCreateVC {
    
    static func instantiate() -> MyTeamCreateVC {
        
        StoryBoardConstants.myTeam.instantiateViewController(
            withIdentifier: String(
                describing: MyTeamCreateVC.self
            )
        ) as! MyTeamCreateVC
    }
}

class MyTeamCreateVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var uiViewProfileCard: UIView!
    
    @IBOutlet var imageViewProfile: UIImageView!
    
    @IBOutlet var textfieldName: AppTextfield!
    @IBOutlet var textfieldMobileNumber: AppTextfield!
    @IBOutlet var textFieldEmail: AppTextfield!
    @IBOutlet var textviewAddress: AppTextView!
    
    var isAdminMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        imageViewProfile.clipsToBounds = true
        
        uiViewToolbar.labelTitle.isHidden = false
        
        if isAdminMode {
            uiViewToolbar.labelTitle.text = "Create Admin"
        } else {
            uiViewToolbar.labelTitle.text = "Create Collector"
        }
        
        uiViewProfileCard.setCardView()
        
        imageViewProfile.layer.cornerRadius = 8
        
        setupDelegates()
    }
    
    private func setupDelegates() {
        
        uiViewToolbar.delegate = self
        
        textfieldName.delegate = self
        textfieldMobileNumber.delegate = self
        textFieldEmail.delegate = self
        textviewAddress.delegate = self
    }
    
    @IBAction func btnCameraPressed(_ sender: UIButton) {
        MediaPicker.shared.chooseOptionForMediaType(delegate: self)
    }
    
    @IBAction func btnCreatePressed(_ sender: AppThemeButton) {
        
    }
    
}

extension MyTeamCreateVC: UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.focusTextField()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.defocusTextField()
    }
    
}

extension MyTeamCreateVC: ToolBarDelegate, MediaPickerDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func mediaPicked(media: MediaData) {
        imageViewProfile.image = media.image
    }
 
}
