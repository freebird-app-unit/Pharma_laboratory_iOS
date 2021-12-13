//
//  TestsListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension TestsListVC {
    static func instantiate() -> TestsListVC {
        StoryBoardConstants.bloodTest.instantiateViewController(withIdentifier: String(describing: TestsListVC.self)) as! TestsListVC
    }
}

class TestsListVC: UIViewController {

    @IBOutlet var tableViewBloodTest: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewBloodTest.register(
            TestsTblCell.loadNib(),
            forCellReuseIdentifier: TestsTblCell.idetifire()
        )
    }
    
    @IBAction func btnAddBloodTestPressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(AddBloodTestVC.instantiate(), animated: true)
    }
    
    
}

extension TestsListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TestsTblCell.idetifire()) as! TestsTblCell
        
        cell.stackViewTest.isHidden = true
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(ReportDetailVC.instantiate(), animated: true)
        
    }
   
}
