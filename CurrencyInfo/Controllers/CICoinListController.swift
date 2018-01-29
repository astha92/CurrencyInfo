//
//  CICoinListController.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class CICoinListController: UIViewController, UIScrollViewDelegate {
    var viewModel:CICoinListViewModel = CICoinListViewModel()
    @IBOutlet weak var coinListTableView: UITableView!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        coinListTableView.tableFooterView = UIView()
        coinListTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
