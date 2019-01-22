//
//  SetTableViewDataSourceSpec.swift
//  magic-the-gatheringTests
//
//  Created by leonel.menezes.lima on 22/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Quick
import Nimble
@testable import magic_the_gathering

class MTGSetTableViewDelegateMock: NSObject, UITableViewDelegate {
    
}

class SetTableViewDataSourceSpec: QuickSpec {
    override func spec() {
        describe("A set table view data source") {
            var dataSource: SetTableViewDatasource!
            var set: MTGSet!
            var tableView: UITableView!
            
            beforeEach {
                set = MTGSet.mock()[0]
                tableView = UITableView(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 500)), style: .grouped)
                dataSource = SetTableViewDatasource(items: [set], tableView: tableView, delegate: MTGSetTableViewDelegateMock())
            }
            
            it("does have a valid datasource", closure: {
                expect(dataSource).toNot(beNil())
            })
            
            it("does have the expected amount of sections and items", closure: {
                expect(tableView.numberOfSections).to(equal(1))
                expect(tableView.numberOfRows(inSection: 0)).to(equal(1))
            })
            
            it("does return the expected kind of cell", closure: {
                let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                expect(cell).toNot(beNil())
                expect(cell).to(beAKindOf(SetTableViewCell.self))
            })
        }
    }
}
