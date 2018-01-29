//
//  CICoinFollowViewModel.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
public class CICoinFollowViewModel {
    //  var viewDelegate : CryptoTrackerViewModelDelegate!
    let ciDao:CIDao = CIDao()
    let appService:CIService = CIService()
    var priceData:[CICoinInfo]!
    public func updateArrayValues() {
        //        appService.makeValueGETRequest()
        //        viewDelegate.updateList(priceArray: ctDao.getAllPrices())
    }
}
