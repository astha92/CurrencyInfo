//
//  CICoinFollowViewModel.swift
//  CurrencyInfo
//
//  Created by Astha Gupta on 1/29/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import RxRealm
import RxCocoa
import RxSwift
import RealmSwift
public class CICoinFollowViewModel {
    let ciDao:CIDao = CIDao()
    let appService:CIService = CIService()
    private let privateDataSource: Variable<[CICoinInfo]> = Variable([])
    private let disposeBag = DisposeBag()
    let dataSource: Observable<[CICoinInfo]>
    init() {
        let realm = try! Realm()
        let values = realm.objects(CICoinInfo.self)
        dataSource = privateDataSource.asObservable()
        Observable.array(from: values).map {
                $0.filter{$0.isFollowed == true}
        }.bind(to: privateDataSource).disposed(by: disposeBag)
    }
    public func updateFollowList(symbol:String) {
        ciDao.followCoin(symbol: symbol)
    }
}
