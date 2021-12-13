//
//  LaboratoryDetailVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension LaboratoryDetailVC {
    static func instantiate() -> LaboratoryDetailVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: LaboratoryDetailVC.self)) as! LaboratoryDetailVC
    }
}

class LaboratoryDetailVC: UIViewController {
 
    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var uiViewShadowView: UIView!
    
    @IBOutlet weak var textfieldLabName: AppTextfield!
    @IBOutlet weak var textfieldLatitude: AppTextfield!
    @IBOutlet weak var textfieldLongitude: AppTextfield!
    @IBOutlet weak var textviewAddress: AppTextView!
    @IBOutlet weak var textfieldCountry: AppTextfield!
    @IBOutlet weak var textfieldState: AppTextfield!
    @IBOutlet weak var textfieldCity: AppTextfield!
    
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
        
        textfieldLabName.delegate = self
        textfieldLatitude.delegate = self
        textfieldLongitude.delegate = self
        textviewAddress.delegate = self
        textfieldCountry.delegate = self
        textfieldState.delegate = self
        textfieldCity.delegate = self
        
        textfieldLabRegularOpenTime.delegate = self
        textfieldLabRegularCloseTime.delegate = self
        textfieldLabRegularLunchCloseTime.delegate = self
        textfieldLabRegularLunchOpenTime.delegate = self
        textfieldLabSundayCloseTime.delegate = self
        textfieldLabSundayOpenTime.delegate = self
        textfieldLabSundayLunchCloseTime.delegate = self
        textfieldLabSundayLunchOpenTime.delegate = self
    }
    
    @IBAction func btnLabRegularOpenTimePressed(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
            Message: Strings.chooseTimeTitle,
            Format: DateHelper.DateStrings.appTimeFormat,
            Mode: .time,
            minimumDate: nil,
            maximumDate: nil) { [self] time in
                textfieldLabRegularOpenTime.text = time
            } NoAction: { action in }

    }
    
    @IBAction func btnLabRegularCloseTimePressed(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabRegularCloseTime.text = time
                } NoAction: { action in }
        
    }
    
    @IBAction func btnTakingRegularLunchYesNo(_ sender: UIButton) {
        
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
    
    @IBAction func btnLabRegularLunchCloseTimePressed(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabRegularLunchCloseTime.text = time
                } NoAction: { action in }
        
    }
    
    @IBAction func btnLabRegularLunchOpenTimePressed(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabRegularLunchOpenTime.text = time
                } NoAction: { action in }
        
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
            stackViewSundayTiming.isHidden = true
        } else {
            stackViewSundayTiming.isHidden = false
        }
        
    }
    
    @IBAction func btnSundayTimingOptionPressed(_ sender: UIButton) {
        
        selectedSundayTimingOption = sender.tag
        
        for btns in btnSundayTimingOption {
            if btns.tag == selectedSundayTimingOption {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_blue"), for: .normal)
            } else {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_grey"), for: .normal)
            }
        }
        
        if selectedSundayTimingOption == 1 {
            stackSundaySpecificTimings.isHidden = true
        } else {
            stackSundaySpecificTimings.isHidden = false
        }
        
    }
    
    @IBAction func btnLabSundayCloseTime(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabSundayCloseTime.text = time
                } NoAction: { action in }
        
    }
    
    @IBAction func btnLabSundayOpenTime(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabSundayOpenTime.text = time
                } NoAction: { action in }
        
    }
    
    @IBAction func btnSundayLunchYesNoPressed(_ sender: UIButton) {
        
        selectedSundayLunchTime = sender.tag
        
        for btns in btnSundayLunchYesNo {
            if btns.tag == selectedSundayLunchTime {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_blue"), for: .normal)
            } else {
                btns.setImage(#imageLiteral(resourceName: "ic_radio_grey"), for: .normal)
            }
        }
        
        if selectedSundayLunchTime == 0 {
            stackViewSundayLunchTiming.isHidden = true
        } else {
            stackViewSundayLunchTiming.isHidden = false
        }
        
    }
    
    @IBAction func btnLabSundayLunchCloseTime(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabSundayLunchCloseTime.text = time
                } NoAction: { action in }
        
    }
    
    @IBAction func btnLabSundayLunchOpenTime(_ sender: UIButton) {
        
        DateHelper
            .shared
            .openDatePicker(
                Message: Strings.chooseTimeTitle,
                Format: DateHelper.DateStrings.appTimeFormat,
                Mode: .time,
                minimumDate: nil,
                maximumDate: nil) { [self] time in
                    textfieldLabSundayLunchOpenTime.text = time
                } NoAction: { action in }
        
    }
    
    
    @IBAction func btnNextPressed(_ sender: AppThemeButton) {
        let vc = TermsAndConditionVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LaboratoryDetailVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension LaboratoryDetailVC: UITextFieldDelegate, UITextViewDelegate {
    
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
