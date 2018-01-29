//
//  CICoinInfoTableViewCell.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import UIKit
public class CICoinInfoTableViewCell : UITableViewCell {
    
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    
    public func initCell(name:String, sym:String) {
        coinName.text = name
        coinSymbol.text = sym
    }
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
    
}
