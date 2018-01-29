//
//  CIService.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
class CIService {
    let ciDao = CIDao()
    let sessionManager:SessionManager!
    init() {
        sessionManager = Alamofire.SessionManager.default
    }
    let url = URL(string: "https://www.cryptocompare.com/api/data/coinlist/")
    public func fetchCoinsInfo() {
        sessionManager.request(url!).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                print(response.result.value!)
                guard let jsonResponse = response.result.value as? [String:Any] else {
                    return
                }
                let json = jsonResponse["Data"] as! [String:Any]
                guard let coin:CICoinModel = Mapper<CICoinModel>().map(JSON: json) else {
                    return
                }
                self.ciDao.updateCoinInfo(coins: [CICoinModel.getCoinData(model: coin)])
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
