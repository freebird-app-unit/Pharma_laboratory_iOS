//
//  MyTeamCollectorsVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension MyTeamCollectorsVC {
    
    static func instantiate() -> MyTeamCollectorsVC {
        
        StoryBoardConstants.myTeam.instantiateViewController(
            withIdentifier: String(
                describing: MyTeamCollectorsVC.self
            )
        ) as! MyTeamCollectorsVC
    }
}

class MyTeamCollectorsVC: UIViewController {

    @IBOutlet var tableViewTeam: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewTeam.register(
            MyTeamTblCell.loadNib(),
            forCellReuseIdentifier: MyTeamTblCell.idetifire()
        )
    }
    
    @IBAction func btnAddAdminPressed(_ sender: CustomButton) {
        
        let vc = MyTeamCreateVC.instantiate()
        vc.isAdminMode = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MyTeamCollectorsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTeamTblCell.idetifire()) as! MyTeamTblCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MyTeamDetailVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
