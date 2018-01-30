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
    private let privateDataSource: Variable<[CICoinInfo]> = Variable([])
    private let disposeBag = DisposeBag()
    let dataSource: Observable<[CICoinInfo]>
    init() {
        let realm = try! Realm()
        let values = realm.objects(CICoinInfo.self)
        dataSource = privateDataSource.asObservable()
        Observable.array(from: values).subscribe(onNext: { [unowned self] text  in
            if (text.last == nil) {
                return
            }
            self.privateDataSource.value.append(text.last!)
        }).disposed(by: disposeBag)
    }
    public func updateList() {
        appService.fetchCoinsInfo()
    }
}
