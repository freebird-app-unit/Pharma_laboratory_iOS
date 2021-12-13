//
//  PackageListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension PackageListVC {
    
    static func instantiate() -> PackageListVC {
        StoryBoardConstants.bloodTest.instantiateViewController(withIdentifier: String(describing: PackageListVC.self)) as! PackageListVC
    }
}

class PackageListVC: UIViewController {

    @IBOutlet weak var tableViewPackageList: UITableView!
    
    @IBOutlet weak var btnAddPackage: CustomButton!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupTableView()
        if AppConfig.userType == .tester {
            btnAddPackage.isHidden = true
        }
    }
    
    private func setupTableView() {
        tableViewPackageList.register(
            TestsTblCell.loadNib(),
            forCellReuseIdentifier: TestsTblCell.idetifire()
        )
    }
    
    @IBAction func btnAddPackagePressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(AddPackageVC.instantiate(), animated: true)
    }
    
    
}

extension PackageListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TestsTblCell.idetifire()) as! TestsTblCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(
            PackageDetailVC.instantiate(),
            animated: true
        )
        
    }
    
}
