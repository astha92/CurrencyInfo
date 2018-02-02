//
//  CoinListTest.swift
//  CurrencyInfoTests
//
//  Created by Astha Gupta on 2/1/18.
//  Copyright © 2018 CurrencyInfo. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CurrencyInfo
class CoinListTest:QuickSpec {
    override func spec() {
        var subject:CICoinListController!
        describe("CICoinListControllerSpec") {
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                subject = storyboard.instantiateViewController(withIdentifier :"CICoinListController") as! CICoinListController
                _ = subject.view
            }
            
            context("when view is loaded") {
                it("should have 0 movies loaded") {
                    expect(subject.coinListTableView.numberOfRows(inSection: 0)).to(equal(1))
                }
            }
            
            context("when view is loaded") {
                it("should have title set") {
                    expect(subject.coinLabel.text).to(equal("Coin List"))
                }
            }
        }
    }
}
