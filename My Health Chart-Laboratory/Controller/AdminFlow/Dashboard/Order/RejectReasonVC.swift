//
//  RejectReasonVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 22/11/21.
//

import UIKit

extension RejectReasonVC {
    static func instantiate() -> RejectReasonVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: RejectReasonVC.self)) as! RejectReasonVC
    }
}

class RejectReasonVC: UIViewController {

    @IBOutlet weak var tableViewRejectReason: UITableView!
    
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    private var dataSource = 10
    
    private var selectedRow = 0
    
    var getRejectReasonTableHeight: CGFloat {
        
        tableViewRejectReason.layoutIfNeeded()
        self.view.layoutIfNeeded()
        
        let height = tableViewRejectReason.contentSize.height + 10
        
        if height > (AppConfig.screenHight - 160) {
            return (AppConfig.screenHight - 160)
        } else {
            return height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewRejectReason.register(
            RejectReasonTblCell.loadNib(),
            forCellReuseIdentifier: RejectReasonTblCell.idetifire()
        )
    }
    
    @IBAction func btnRejectPressed(_ sender: CustomButton) {
    }
    
    @IBAction func btnLaterPressed(_ sender: CustomButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension RejectReasonVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RejectReasonTblCell.idetifire()) as! RejectReasonTblCell
        cell.isSelectedRow = indexPath.row == selectedRow
        
        cell.selectRow = { [self] in
            
            selectedRow = indexPath.row
            
            tableView.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableViewHeight.constant = getRejectReasonTableHeight
    }

}
