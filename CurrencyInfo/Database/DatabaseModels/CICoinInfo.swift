//
//  CICoinInfo.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import RealmSwift
public class CICoinInfo:Object {
    @objc dynamic var symbol = ""
    @objc dynamic var coinName = ""
    @objc dynamic var isFollowed = false
    override public static func primaryKey() -> String? {
        return "symbol"
    }
}
