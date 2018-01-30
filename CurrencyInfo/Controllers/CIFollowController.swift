//
//  CIFollowController.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Firebase
class CIFollowController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel:CICoinFollowViewModel = CICoinFollowViewModel()
    @IBOutlet weak var followListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        followListTableView.tableFooterView = UIView()
        followListTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.dataSource.asObservable().bind(to: followListTableView.rx.items(cellIdentifier: "followCell", cellType: CICoinFollowTableViewCell.self)) {
            (row, element, cell) in
            cell.initCell(name: element.coinName)
        }.disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Analytics.logEvent("astha", parameters: ["name":"gupta"])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension CIFollowController:UIScrollViewDelegate {
}
