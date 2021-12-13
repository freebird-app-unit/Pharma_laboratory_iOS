//
//  EditProfileVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension EditProfileVC {
    static func instantiate() -> EditProfileVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: EditProfileVC.self)) as! EditProfileVC
    }
}

class EditProfileVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var uiViewShadowView: UIView!
    
    @IBOutlet weak var textfieldLabRegularOpenTime: AppTextfield!
    @IBOutlet weak var textfieldLabRegularCloseTime: AppTextfield!
    @IBOutlet weak var textfieldLabRegularLunchCloseTime: AppTextfield!
    @IBOutlet weak var textfieldLabRegularLunchOpenTime: AppTextfield!
    @IBOutlet weak var textfieldLabSundayCloseTime: AppTextfield!
    @IBOutlet weak var textfieldLabSundayOpenTime: AppTextfield!
    @IBOutlet weak var textfieldLabSundayLunchCloseTime: AppTextfield!
    @IBOutlet weak var textfieldLabSundayLunchOpenTime: AppTextfield!
    
    @IBOutlet var btnTakingRegularLunchYesNo: [UIButton]!
    @IBOutlet weak var stackViewTakingRegularLunch: UIStackView!
    
    @IBOutlet var btnOpenOnSundayYesNo: [UIButton]!
    @IBOutlet weak var stackViewSundayOpenCloseTimeOption: UIStackView!
    @IBOutlet var btnSundayTimingOption: [UIButton]!
    @IBOutlet weak var stackViewSundayTiming: UIStackView!
    @IBOutlet weak var stackSundaySpecificTimings: UIStackView!
    
    @IBOutlet var btnSundayLunchYesNo: [UIButton]!
    @IBOutlet weak var stackViewSundayLunchTiming: UIStackView!
    
    var selectedTakingRegularLunch = 1
    var selectedOpenOnSunday = 1
    var selectedSundayTimingOption = 0
    var selectedSundayLunchTime = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        labelTitle.font = .appFont.medium(ofSize: 22)
        labelSubTitle.font = .appFont.regular(ofSize: 14)
        uiViewShadowView.setCardView()
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
        textfieldLabRegularOpenTime.delegate = self
        textfieldLabRegularCloseTime.delegate = self
        textfieldLabRegularLunchCloseTime.delegate = self
        textfieldLabRegularLunchOpenTime.delegate = self
        textfieldLabSundayCloseTime.delegate = self
        textfieldLabSundayOpenTime.delegate = self
        textfieldLabSundayLunchCloseTime.delegate = self
        textfieldLabSundayLunchOpenTime.delegate = self
    }
    
    @IBAction func btnTakingRegularLunchYesNoPressed(_ sender: UIButton) {
        
        selectedTakingRegularLunch = sender.tag
        
        for btns in btnTakingRegularLunchYesNo {
            if btns.tag == selectedTakingRegularLunch {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_blue"), for: .normal)
            } else {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_grey"), for: .normal)
            }
        }
        
        if selectedTakingRegularLunch == 0 {
            stackViewTakingRegularLunch.isHidden = true
        } else {
            stackViewTakingRegularLunch.isHidden = false
        }
    }
    
    @IBAction func btnOpenOnSundayYesNoPressed(_ sender: UIButton) {
        
        selectedOpenOnSunday = sender.tag
        
        for btns in btnOpenOnSundayYesNo {
            if btns.tag == selectedOpenOnSunday {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_blue"), for: .normal)
            } else {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_grey"), for: .normal)
            }
        }
        
        if selectedOpenOnSunday == 0 {
            stackViewSundayOpenCloseTimeOption.isHidden = true
        } else {
            stackViewSundayOpenCloseTimeOption.isHidden = false
        }
        
    }
    

}

extension EditProfileVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension EditProfileVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
}
