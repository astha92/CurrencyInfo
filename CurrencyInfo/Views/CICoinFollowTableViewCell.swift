//
//  CICoinFollowTableViewCell.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/30/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import UIKit
public class CICoinFollowTableViewCell : UITableViewCell {
    @IBOutlet weak var coinName: UILabel!
    public func initCell(name:String) {
        coinName.text = name
    }
}
