//
//  MagicAPIServiceSpec.swift
//  magic-the-gatheringTests
//
//  Created by gabriel.n.reynoso on 29/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Quick
import Nimble

@testable import magic_the_gathering

class MagicAPIServiceSpec: QuickSpec {
    
    let operation = NetworkOperationMock()
    lazy var service = MagicAPIService(operation: operation)
    
    private func serviceSuccessTestCase() {
        operation.errorType = .none
        
        var succeded = false
        service.getSet { result in
            switch result {
            case .success(_):
                succeded = true
            case .error(_):
                fail()
            }
        }
        expect(succeded).to(beTrue())
    }
    
    private func serviceErrorTestCase(matchingMessage: String) {
        
        var errorMessage: String!
        service.getSet { result in
            switch result {
            case .success(_):
                fail()
            case .error(let error):
                errorMessage = error.localizedDescription
            }
        }
        expect(errorMessage).to(equal(matchingMessage))
    }
    
    override func spec() {
        
        describe("Magic API service") {
            
            context("requesting cards before sets") {
                
                beforeEach {
                    self.operation.returnType = .cards
                }
                
                it("has to fail for trying to get cards before getting a set") {
                    self.serviceErrorTestCase(matchingMessage: "Attempting to request cards without requesting a set first.")
                }
            }
            
            context("requesting sets") {
                
                beforeEach {
                    self.operation.returnType = .sets
                }
                
                it("has to fail because of changed response format") {
                    self.operation.errorType = .changedReponse
                    self.serviceErrorTestCase(matchingMessage: "Magic API may have changed the Sets JSON response format!")
                }
                
                it("has to fail because of network error") {
                    self.operation.errorType = .network
                    self.serviceErrorTestCase(matchingMessage: "Network error!")
                }
                
                it("has to succed and cache sets") {
                    self.serviceSuccessTestCase()
                }
                
                it("has to succed and return saet from cache") {
                    self.serviceSuccessTestCase()
                }
            }
            
            context("requesting cards after sets") {
                
                beforeEach {
                    self.operation.returnType = .cards
                }
                
                it("has to fail because of changed response format") {
                    self.operation.errorType = .changedReponse
                    self.serviceErrorTestCase(matchingMessage: "Magic API may have changed the Cards JSON response format!")
                }
                
                it("has to fail because of network error") {
                    self.operation.errorType = .network
                    self.serviceErrorTestCase(matchingMessage: "Network error!")
                }
                
                it("has to succed") {
                    self.operation.errorType = .none
                    self.serviceSuccessTestCase()
                }
            }
        }
    }
}
