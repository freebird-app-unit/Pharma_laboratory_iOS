//
//  CollectorOrderDetailVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

extension CollectorOrderDetailVC {
    
    static func instantiate() -> CollectorOrderDetailVC {
        StoryBoardConstants.collectorDashboard.instantiateViewController(
            withIdentifier: String(
                describing: CollectorOrderDetailVC.self
            )
        ) as! CollectorOrderDetailVC
    }
}

class CollectorOrderDetailVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet weak var tableViewTests: UITableView!
    
    @IBOutlet var collectionViewReports: UICollectionView!
    @IBOutlet var collectionViewInvoice: UICollectionView!
    
    
    
    @IBOutlet var scrollbarContent: UIScrollView!
    
    @IBOutlet var testTableHeight: NSLayoutConstraint!
    
    private let dataSource = 3
    
    private let reportDataSource = 3
    private let invoiceDataSource = 1
    
    private var getTableHeight: CGFloat {
        tableViewTests.layoutIfNeeded()
        scrollbarContent.layoutIfNeeded()
        self.view.layoutIfNeeded()
        return tableViewTests.contentSize.height + 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Order Number"
        uiViewToolbar.labelTitle.isHidden = false
        
        setupDelegate()
        setupTableView()
        setupCollectionView()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
    }
    
    private func setupTableView() {
        tableViewTests.register(
            TestListTblCell.loadNib(),
            forCellReuseIdentifier: TestListTblCell.idetifire()
        )
    }
    
    private func setupCollectionView() {
        collectionViewReports.register(
            ReportsCollectionCell.loadNib(),
            forCellWithReuseIdentifier: ReportsCollectionCell.idetifire()
        )
        collectionViewInvoice.register(
            ReportsCollectionCell.loadNib(),
            forCellWithReuseIdentifier: ReportsCollectionCell.idetifire()
        )
        setFlowLayout()
    }
    
    private func setFlowLayout() {
        
        let reportLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        reportLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        reportLayout.minimumInteritemSpacing = 0
        reportLayout.minimumLineSpacing = 4
        reportLayout.scrollDirection = .horizontal
        
        collectionViewReports.collectionViewLayout = reportLayout
        
        let invoiceLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        invoiceLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        invoiceLayout.minimumInteritemSpacing = 0
        invoiceLayout.minimumLineSpacing = 4
        invoiceLayout.scrollDirection = .horizontal
        
        collectionViewInvoice.collectionViewLayout = invoiceLayout
        
    }
    
    @IBAction func btnRejectOrderPressed(_ sender: CustomButton) {
        present(RejectReasonVC.instantiate(), animated: true, completion: nil)
    }
    
    @IBAction func btnAcceptPressed(_ sender: AppThemeButton) {
        present(AssignOrderVC.instantiate(), animated: true, completion: nil)
    }
    
    
    
}

extension CollectorOrderDetailVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        dataSource
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TestListTblCell.idetifire()
        ) as! TestListTblCell
        
        
        if indexPath.row == (dataSource - 1) {
            cell.stackViewTotalAmount.isHidden = false
        }
        
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        
        testTableHeight.constant = getTableHeight
    }
    
}

extension CollectorOrderDetailVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        if collectionView == collectionViewReports {
            return reportDataSource
        } else {
            return invoiceDataSource
        }
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        if collectionView == collectionViewReports {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ReportsCollectionCell.idetifire(),
                for: indexPath
            ) as! ReportsCollectionCell
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ReportsCollectionCell.idetifire(),
                for: indexPath
            ) as! ReportsCollectionCell
            
            cell.labelReportName.text = "Invoice"
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 110)
    }
    
}

extension CollectorOrderDetailVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
