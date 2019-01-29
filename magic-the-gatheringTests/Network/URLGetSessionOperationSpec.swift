//
//  URLGetSessionOperationSpec.swift
//  magic-the-gatheringTests
//
//  Created by gabriel.n.reynoso on 29/01/19.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Quick
import Nimble

@testable import magic_the_gathering

class URLGetSessionOperationSpec: QuickSpec {
    
    override func spec() {
        
        describe("URL get operation") {
            
            it("has to keep the route received") {
                let operation = URLSessionGetOperation<String>(route: "luta armada")
                expect(operation.route).to(equal("luta armada"))
            }
            
            it("has to fail with unsuported url error") {
                let operation = URLSessionGetOperation<String>(route: "anarquia")
                waitUntil { done in
                    operation.execute { result in
                        switch result {
                        case .error(let error):
                            expect(error.localizedDescription).to(equal("unsupported URL"))
                        default:
                            fail()
                        }
                        done()
                    }
                }
            }
            
            it("has to fail with bad url format error") {
                let operation = URLSessionGetOperation<String>(route: "anarquia total")
                waitUntil { done in
                    operation.execute { result in
                        switch result {
                        case .error(let error):
                            expect(error.localizedDescription).to(equal("Bad formated url!"))
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
