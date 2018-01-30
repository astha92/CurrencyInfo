//
//  CIDao.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import RealmSwift
//Dao is a logical grouping of queries for multiple tables. In this example we just have one table
public class CIDao {
    private var realm:Realm?
    init() {
        realm = try! Realm()
    }
    public func updateCoinInfo(coins:[CICoinInfo]) {
        for coin in coins {
            try! realm?.write() {
                realm?.add(coin, update: true)
            }
        }
    }
    
    public func getAllCoins() -> Results<CICoinInfo>? {
        return realm?.objects(CICoinInfo.self)
    }
    
    public func followCoin(symbol:String) {
        let coin:CICoinInfo = (realm?.object(ofType: CICoinInfo.self, forPrimaryKey: symbol))!
        try! realm?.write() {
            coin.isFollowed = true
        }
    }
}

