//
//  CICoinListViewModel.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxRealm
public class CICoinListViewModel {
    let ciDao:CIDao = CIDao()
    let appService:CIService = CIService()
    var coinInfo:[CICoinInfo]!
    
    init() {
        let realm = try! Realm()
        let values = realm.objects(CICoinInfo.self)
        Observable.array(from: values).subscribe(onNext: { text  in
            self.coinInfo = text
            //print("++++++++++++++++", (text as! [CICoinInfo]).first?.coinName)
        })
        
    }
   // var dataSource:Observable<[CICoinInfo]>
    public func updateList() {
        
      // Observable.as
        appService.fetchCoinsInfo()
    }
}
