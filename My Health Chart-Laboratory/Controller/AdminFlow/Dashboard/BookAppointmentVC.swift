//
//  BookAppointmentVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension BookAppointmentVC {
    static func instantiate() -> BookAppointmentVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: BookAppointmentVC.self)) as! BookAppointmentVC
    }
}

class BookAppointmentVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet var textfieldPatientName: AppTextfield!
    @IBOutlet var textfieldMobileNumber: AppTextfield!
    @IBOutlet var textfieldAge: AppTextfield!
    
    @IBOutlet var btnGender: [UIButton]!
    @IBOutlet var btnTestAt: [UIButton]!
    @IBOutlet var btnReportCollectionType: [UIButton]!
    
    @IBOutlet var textfieldDate: AppTextfield!
    @IBOutlet var textfieldTime: AppTextfield!
    
    @IBOutlet var textviewAddress: AppTextView!
    @IBOutlet var textviewDeliveryAddress: AppTextView!
    
    @IBOutlet var stackViewTestAtHome: UIStackView!
    @IBOutlet var stackViewHomeDelivery: UIStackView!
    
    
    private var selectedGender = 0
    private var selectedTestAt = 0
    private var selectedPhysical = 0
    private var isAsPerAbove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        uiViewToolbar.labelTitle.text = "Book Appointment"
        uiViewToolbar.labelTitle.isHidden = false
        textfieldDate.backgroundColor = .appColor.appSecondaryColor
        textfieldTime.backgroundColor = .appColor.appSecondaryColor
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        textfieldPatientName.delegate = self
        textfieldMobileNumber.delegate = self
        textfieldAge.delegate = self
        textviewAddress.delegate = self
        textviewDeliveryAddress.delegate = self
    }
    
    @IBAction func btnGenderPressed(_ sender: UIButton) {
        
        selectedGender = sender.tag
        
        for btn in btnGender {
            if btn.tag == selectedGender {
                btn.setTitleColor(.appColor.appPrimaryColor, for: .normal)
                btn.setImage(.appImage.icRadioBlue , for: .normal)
            } else {
                btn.setTitleColor(.appColor.appFontSecondaryColor, for: .normal)
                btn.setImage(.appImage.icRadioGrey , for: .normal)
            }
        }
        
    }
    
    @IBAction func btnTestAtPressed(_ sender: UIButton) {
        
        selectedTestAt = sender.tag
        
        for btn in btnTestAt {
            if btn.tag == selectedTestAt {
                btn.setTitleColor(.appColor.appPrimaryColor, for: .normal)
                btn.setImage(.appImage.icRadioBlue , for: .normal)
            } else {
                btn.setTitleColor(.appColor.appFontSecondaryColor, for: .normal)
                btn.setImage(.appImage.icRadioGrey , for: .normal)
            }
        }
        
        if selectedTestAt == 1 {
            stackViewTestAtHome.isHidden = false
        } else {
            stackViewTestAtHome.isHidden = true
        }
        
    }
    
    @IBAction func btnSelectDatePressed(_ sender: UIButton) {
        
        DateHelper.shared.openDatePicker(
            Message: Strings.chooseDateTitle,
            Format: DateHelper.DateStrings.appDateFormat,
            Mode: .date,
            minimumDate: Date(),
            maximumDate: nil,
            YesAction: { [self] dateString in
                textfieldDate.text = dateString
            },
            NoAction: nil
        )
        
    }
    
    @IBAction func btnSelectTimePressed(_ sender: UIButton) {
        
        DateHelper.shared.openDatePicker(
            Message: Strings.chooseTimeTitle,
            Format: DateHelper.DateStrings.appTimeFormat,
            Mode: .time,
            minimumDate: nil,
            maximumDate: nil,
            YesAction: { [self] dateString in
                textfieldTime.text = dateString
            },
            NoAction: nil
        )
        
    }
    
    @IBAction func btnPhysicalReportCollectionTypePressed(_ sender: UIButton) {
        
        selectedPhysical = sender.tag
        
        for btn in btnReportCollectionType {
            if btn.tag == selectedPhysical {
                btn.setTitleColor(.appColor.appPrimaryColor, for: .normal)
                btn.setImage(.appImage.icRadioBlue , for: .normal)
            } else {
                btn.setTitleColor(.appColor.appFontSecondaryColor, for: .normal)
                btn.setImage(.appImage.icRadioGrey , for: .normal)
            }
        }
        
        if selectedPhysical == 1 {
            stackViewHomeDelivery.isHidden = false
        } else {
            stackViewHomeDelivery.isHidden = true
        }
        
    }
    
    
    @IBAction func btnAsPerAbovePressed(_ sender: UIButton) {
        
        isAsPerAbove.toggle()
        
        sender.tintColor = isAsPerAbove ?
            .appColor.appPrimaryColor :
            .appColor.appFontSecondaryColor
        
        sender.setImage(
            isAsPerAbove ?
            UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square"),
            for: .normal
        )
        
    }
    
    @IBAction func btnSelectTestPressed(_ sender: AppThemeButton) {
        self.navigationController?.pushViewController(SelectTestVC.instantiate(), animated: true)
    }
    
  
}

extension BookAppointmentVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension BookAppointmentVC: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.focusTextField()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.defocusTextField()
    }
    
}
