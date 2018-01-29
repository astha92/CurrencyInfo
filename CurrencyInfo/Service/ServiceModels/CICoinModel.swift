//
//  CICoinModel.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import ObjectMapper
class CICoinModel:Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        symbol <- map["Symbol"]
        coinName <- map["CoinName"]
    }
    
    public static func getCoinDataArray(coins:[CICoinModel]) -> [CICoinInfo] {
        var coinArray:[CICoinInfo]!
        for cModel in coins {
            coinArray.append(getCoinData(model: cModel))
        }
        return coinArray
    }
    
    public static func getCoinData(model:CICoinModel) -> CICoinInfo {
        let coin:CICoinInfo = CICoinInfo()
        coin.coinName = "random"
//        coin.coinName = model.coinName!
//        coin.symbol = model.symbol!
        return coin
    }
    
    var coinName:String?
    var symbol:String?
}

