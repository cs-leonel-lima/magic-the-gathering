//
//  MTGSetSpec.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class MTGSetSpec: QuickSpec {
    
    override func spec() {
        describe("Testing MTGSet model with a JSON file") {
            
            var setsDataMock: Data!
            var falseDataMock: Data!
            
            beforeEach {
                setsDataMock = JSONHelper.getDataFrom(resource: "sets")
                falseDataMock = JSONHelper.getDataFrom(resource: "cards")
            }
            
            it("Should get an array of MTGSets from data") {
                if let sets = MTGSet.initializeSetsArray(from: setsDataMock) {
                    expect(sets).toNot(beNil())
                    expect(sets.count).to(beGreaterThan(0))
                } else {
                    fail("failed to decode data")
                }
            }
            
            it("Should't return nil") {
                if let sets = MTGSet.initializeSetsArray(from: falseDataMock) {
                    expect(sets).toNot(beNil())
                    expect(sets.count).to(beGreaterThan(0))
                } else {
                    fail("failed to decode data")
                }
            }
            
            context("Comparing MTGSets") {
                it("Should match two sets based on their codes") {
                    let set1 = MTGSet(name: "Ravnika", code: "123", releaseDate: nil)
                    let set2 = MTGSet(name: "Zendikar", code: "123", releaseDate: nil)
                    expect(set1).to(equal(set2))
                }
                
                it("Shouldn't match sets with different codes") {
                    let set1 = MTGSet(name: "Zendikar", code: "0", releaseDate: nil)
                    let set2 = MTGSet(name: "Zendikar", code: "123", releaseDate: nil)
                    expect(set1).toNot(equal(set2))
                }
                
                it("Should return true if set is newer than other set") {
                    let set1 = MTGSet(name: "Zendikar", code: "0", releaseDate: Date())
                    let set2 = MTGSet(name: "Zendikar", code: "123", releaseDate: Date().addingTimeInterval(60))
                    expect(set2).to(beGreaterThan(set1))
                }
                
                it("Should return false if set is older than other set") {
                    let set1 = MTGSet(name: "Zendikar", code: "0", releaseDate: Date())
                    let set2 = MTGSet(name: "Zendikar", code: "123", releaseDate: Date().addingTimeInterval(60))
                    expect(set1).toNot(beGreaterThan(set2))
                }
                
                it("Should return false if either set's release date is nil") {
                    let set1 = MTGSet(name: "Zendikar", code: "0", releaseDate: nil)
                    let set2 = MTGSet(name: "Zendikar", code: "123", releaseDate: nil)
                    expect(set1).toNot(beGreaterThan(set2))
                }
            }
            
        }
    }
    
}
