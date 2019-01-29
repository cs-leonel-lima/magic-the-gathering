import Foundation
import Quick
import Nimble

@testable import magic_the_gathering

class MTGSetSpec: QuickSpec {
    
    override func spec() {
        describe("Testing MTGSet model with a JSON file") {
            
            var setsDataMock: [MTGSet]!
            
            beforeEach {
                setsDataMock = JSONHelper.objectFrom(resource: "sets")
            }
            
            it("Should get an array of MTGSets from data") {
                expect(setsDataMock).toNot(beNil())
                expect(setsDataMock.count).to(beGreaterThan(0))
            }
            
            it("Shouldn't return nil") {
                expect(setsDataMock).toNot(beNil())
                expect(setsDataMock.count).to(beGreaterThan(0))

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
