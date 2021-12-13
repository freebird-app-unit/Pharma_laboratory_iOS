//
//  AddPackageVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension AddPackageVC {
    
    static func instantiate() -> AddPackageVC {
        
        StoryBoardConstants.bloodTest.instantiateViewController(
            withIdentifier: String(
                describing: AddPackageVC.self
            )
        ) as! AddPackageVC
    }
}

class AddPackageVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var textfieldPackageName: AppTextfield!
    @IBOutlet var textPrecaution: AppTextfield!
    @IBOutlet var textfieldPrice: AppTextfield!
    
    @IBOutlet var textviewAbout: AppTextView!
    @IBOutlet var textviewBenefits: AppTextView!
    
    @IBOutlet var btnSampleNeed: [UIButton]!
    
    @IBOutlet var collectionViewTests: UICollectionView!
    
    private var isBloodSampleSelected = false
    private var isUrineSampleSelected = false
    private var isOtherSampleSelected = false
    
    @IBOutlet var btnAdd: AppThemeButton!
    
    var testDataSource : [String] = ["CBC", "ABC", "DEF"]
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Add Package"
        uiViewToolbar.labelTitle.isHidden = false
        
        setupDelegates()
        
        if isEditMode {
            btnAdd.setTitle("Update", for: .normal)
            uiViewToolbar.labelTitle.text = "Edit Package"
        }
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
        textfieldPackageName.delegate = self
        textPrecaution.delegate = self
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

extension AddPackageVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        testDataSource.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == testDataSource.count {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddTestCollCell.identifire(),
                for: indexPath
            ) as! AddTestCollCell
            
            cell.addTest = { [self] in
                let vc = BloodTestListVC.instantiate()
                present(vc, animated: true, completion: nil)
            }
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TestCollCell.identifire(),
                for: indexPath
            ) as! TestCollCell
            
            cell.labelTest.text = testDataSource[indexPath.row]
            
            return cell
            
        }
    }
 
}

extension AddPackageVC: UITextFieldDelegate, UITextViewDelegate {
    
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

extension AddPackageVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

class TestCollCell: UICollectionViewCell {
    
    @IBOutlet var labelTest: UILabel!
    
    var delete: (()->Void)?
    
    @IBAction func btnDeletePressed(_ sender: CustomButton) {
        delete?()
    }
    
}

extension TestCollCell {
    
    static func identifire() -> String {
        String(describing: TestCollCell.self)
    }
    
}

class AddTestCollCell: UICollectionViewCell {
    
    var addTest: (()->Void)?
    
    @IBAction func btnAddTestPressed(_ sender: AppThemeButton) {
        addTest?()
    }
    
}

extension AddTestCollCell {
    
    static func identifire() -> String {
        String(describing: AddTestCollCell.self)
    }
    
}
