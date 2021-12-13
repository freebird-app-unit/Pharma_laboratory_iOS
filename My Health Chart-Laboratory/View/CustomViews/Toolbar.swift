//
//  Toolbar.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 17/11/21.
//

import UIKit

@objc protocol ToolBarDelegate {
    
    // Event Configs
    @objc optional func btnBackPressed()
    @objc optional func searchPressed()
    @objc optional func settingsPressed()
    @objc optional func notificationPressed()
    @objc optional func clearAllPressed()
}

class Toolbar: UIView {

    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet var btnSetting: UIButton!
    
    @IBOutlet weak var btnClearAll: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var delegate: ToolBarDelegate?
    
    private var isSearchMode = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(getNib())
        subviews[0].frame = bounds
        searchBar.delegate = self
        
    }
    
    func getNib() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: Toolbar.self), owner: self, options: nil)!.first as! UIView
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        delegate?.btnBackPressed?()
    }
    
    @IBAction func btnClearAllPressed(_ sender: UIButton) {
        delegate?.clearAllPressed?()
    }
    
    @IBAction func btnSearchPressed(_ sender: Any) {
        delegate?.searchPressed?()
    }
    
    @IBAction func btnSettingsPressed(_ sender: UIButton) {
        delegate?.settingsPressed?()
    }
    
    
    func setSearchMode(with: Bool) {
        searchBar.isHidden = !with
        btnSearch.isHidden = with
        labelTitle.isHidden = with
    }
    

}

extension Toolbar: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        endEditing(true)
        searchBar.text = nil
        setSearchMode(with: false)
        delegate?.searchPressed?()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        endEditing(true)
        delegate?.searchPressed?()
    }
    
}
