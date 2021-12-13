//
//  AssignOrderVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 22/11/21.
//

import UIKit

extension AssignOrderVC {
    static func instantiate() -> AssignOrderVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: AssignOrderVC.self)) as! AssignOrderVC
    }
}

class AssignOrderVC: UIViewController {

    @IBOutlet var textfieldDropDown: AppTextfield!
    
    let dropdown = DropDown()
    
    let dataSource = ["abc", "def", "ghi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setupDropDown()
        setupTextfield()
    }
    
    private func setupDropDown() {
        
        dropdown.anchorView = textfieldDropDown
        
        dropdown.dataSource = dataSource
        
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            textfieldDropDown.text = item
        }

        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.topOffset = CGPoint(x: 0, y:-(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.dismissMode = .automatic
        
        dropdown.backgroundColor = .white
        
        dropdown.cornerRadius = 5
       
    }
    
    private func setupTextfield() {
        textfieldDropDown.layer.borderColor = UIColor.appColor.appFontSecondaryColor.cgColor
        
        textfieldDropDown.focusTextField()
        
        textfieldDropDown.layer.borderWidth = 0.5
    }
    
    @IBAction func btnDropDownPressed(_ sender: UIButton) {
        dropdown.show()
    }
    
    @IBAction func btnAssignPressed(_ sender: AppThemeButton) {
    }
    
    @IBAction func btnLaterPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
