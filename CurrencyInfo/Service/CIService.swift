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
    let url = URL(string: "https://min-api.cryptocompare.com/data/all/coinlist")
    public func fetchCoinsInfo() {
        sessionManager.request(url!).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                guard let jsonResponse = response.result.value as? [String: Any] else {
                    return
                }
								let json = Array((jsonResponse["Data"] as! [String: Any]).values) as! [[String: Any]]
                guard let coins = Mapper<CICoinModel>().mapArray(JSONArray: json) else {
                    return
                }
                self.ciDao.updateCoinInfo(coins: CICoinModel.getCoinDataArray(coins: coins))
            case .failure(let error):
                print(error)
            }
        }
    }
}
