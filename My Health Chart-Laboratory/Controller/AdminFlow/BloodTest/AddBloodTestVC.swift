//
//  AddBloodTestVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension AddBloodTestVC {
    static func instantiate() -> AddBloodTestVC {
        StoryBoardConstants.bloodTest.instantiateViewController(withIdentifier: String(describing: AddBloodTestVC.self)) as! AddBloodTestVC
    }
}

class AddBloodTestVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var textfieldReportName: AppTextfield!
    @IBOutlet var textfieldPrecaution: AppTextfield!
    @IBOutlet var textfieldPrice: AppTextfield!
    
    @IBOutlet var textviewAbout: AppTextView!
    @IBOutlet var textviewBenefits: AppTextView!
    
    @IBOutlet var btnSampleNeed: [UIButton]!
    
    private var isBloodSampleSelected = false
    private var isUrineSampleSelected = false
    private var isOtherSampleSelected = false
    
    var isEditMode = false
    
    @IBOutlet var btnAdd: AppThemeButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Add Report"
        uiViewToolbar.labelTitle.isHidden = false
        
        setupDelegates()
        
        if isEditMode {
            btnAdd.setTitle("Update", for: .normal)
            uiViewToolbar.labelTitle.text = "Edit Report"
        }
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
        textfieldReportName.delegate = self
        textfieldPrecaution.delegate = self
        textfieldPrice.delegate = self
        textviewAbout.delegate = self
        textviewBenefits.delegate = self
    }
    
    @IBAction func btnSamplePressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            isBloodSampleSelected.toggle()
            
            btnSampleNeed[sender.tag].setImage(
                isBloodSampleSelected ?
                UIImage(systemName: "checkmark.square.fill") :
                    UIImage(systemName: "square"),
                for: .normal
            )
            
            btnSampleNeed[sender.tag].tintColor = isBloodSampleSelected ?
                .appColor.appPrimaryColor :
                .appColor.appFontSecondaryColor
            
        } else if sender.tag == 1 {
            
            isUrineSampleSelected.toggle()
            
            btnSampleNeed[sender.tag].setImage(
                isUrineSampleSelected ?
                UIImage(systemName: "checkmark.square.fill") :
                    UIImage(systemName: "square"),
                for: .normal
            )
            
            btnSampleNeed[sender.tag].tintColor = isUrineSampleSelected ?
                .appColor.appPrimaryColor :
                .appColor.appFontSecondaryColor
            
        } else if sender.tag == 2 {
            
            isOtherSampleSelected.toggle()
            
            btnSampleNeed[sender.tag].setImage(
                isOtherSampleSelected ?
                UIImage(systemName: "checkmark.square.fill") :
                    UIImage(systemName: "square"),
                for: .normal
            )
            
            btnSampleNeed[sender.tag].tintColor = isOtherSampleSelected ?
                .appColor.appPrimaryColor :
                .appColor.appFontSecondaryColor
            
        }
        
    }
    
}

extension AddBloodTestVC: UITextFieldDelegate, UITextViewDelegate {
    
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

extension AddBloodTestVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
