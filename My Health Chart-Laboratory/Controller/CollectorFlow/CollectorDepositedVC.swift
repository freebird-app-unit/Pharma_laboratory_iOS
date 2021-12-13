//
//  CollectorDepositedVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension CollectorDepositedVC {
    
    static func instantiate() -> CollectorDepositedVC {
        StoryBoardConstants.collectorDashboard.instantiateViewController(
            withIdentifier: String(
                describing: CollectorDepositedVC.self
            )
        ) as! CollectorDepositedVC
    }
}

class CollectorDepositedVC: UIViewController {

    @IBOutlet var collectionViewLabList: UICollectionView!
    @IBOutlet var tableViewOrder: UITableView!
    
    private var labDataSource: [String] = ["All", "Lab1", "Lab2"]
    private var orderDataSource = 5
    private var selectedCollectorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewOrder.register(
            CollectorSampleTblCell.loadNib(),
            forCellReuseIdentifier: CollectorSampleTblCell.idetifire()
        )
    }
    
    @IBAction func btnNotificationPressed(_ sender: CustomButton) {
    }
    
    
    
}

extension CollectorDepositedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectorsCollCell.idetifire(),
            for: indexPath
        ) as! CollectorsCollCell
        
        cell.labelCollector.text = labDataSource[indexPath.row]
        
        if indexPath.row == selectedCollectorIndex {
            
            cell.labelCollector.font = .appFont.medium(ofSize: 14)
            cell.uiViewBordersView.backgroundColor = .appColor.appPrimaryColor
            cell.uiViewBordersView.borderColor = .clear
            cell.labelCollector.textColor = .white
            
        } else {
            cell.labelCollector.font = .appFont.regular(ofSize: 14)
            cell.uiViewBordersView.backgroundColor = .white
            cell.uiViewBordersView.borderColor = .appColor.appFontSecondaryColor
            cell.labelCollector.textColor = .appColor.appFontSecondaryColor
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCollectorIndex = indexPath.row
        collectionView.reloadData()
    }
    
}

extension CollectorDepositedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderDataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectorSampleTblCell.idetifire()
        ) as! CollectorSampleTblCell
        
        
        return cell
    }
    
}
