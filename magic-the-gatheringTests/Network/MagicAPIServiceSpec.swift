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
    
    override func spec() {
        
        let service = MagicAPIService()
        
        describe("Magic API service") {
            
            it("has to fail for trying to get cards before getting a set") {
                waitUntil { done in
                    service.getCards { result in
                        switch result {
                        case .error(let error):
                            expect(error.localizedDescription).to(equal("Attempting to request cards without requesting a set first."))
                        default:
                            fail()
                        }
                        done()
                    }
                }
            }
        }
    }
}
