//import Quick
//import Nimble
//
//@testable import magic_the_gathering
//
//class MockSession: URLSession {
//
//    var returnType: ReturnType = .sets
//    var succed: Bool = false
//
//    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//
//        if succed {
//            switch returnType {
//            case .sets:
//                completionHandler(MTGSet.responseData(), nil, nil)
//            case .cards:
//                completionHandler(Card.responseData(), nil, nil)
//            }
//        } else {
//            completionHandler(nil, nil, "error")
//        }
//
//        return super.dataTask(with: request)
//    }
//}
//
//class URLSessionGetOperationSpec: QuickSpec {
//
//    override func spec() {
//        
//        describe("URL get operation") {
//
//            let mockSession = MockSession()
//            let operation = URLSessionGetOperation(session: mockSession)
//
//            context("creating url") {
//                
//                it("has to fail with unsuported url error") {
//                    let operation = URLSessionGetOperation()
//                    waitUntil { done in
//                        operation.request(at: "anarquia", decodingType: String.self) { result in
//                            switch result {
//                            case .error(let error):
//                                expect(error.localizedDescription).to(equal("unsupported URL"))
//                            default:
//                                fail()
//                            }
//                            done()
//                        }
//                    }
//                }
//
//                it("has to fail with bad url format error") {
//                    let operation = URLSessionGetOperation()
//                    waitUntil { done in
//                        operation.request(at: "anarquia total", decodingType: String.self) { result in
//                            switch result {
//                            case .error(let error):
//                                expect(error.localizedDescription).to(equal("Bad formated url!"))
//                            default:
//                                fail()
//                            }
//                            done()
//                        }
//                    }
//                }
//            }
//            
//            context("resuming task") {
//
//                it("has to fail") {
//                    
//                    mockSession.succed = true
//                    var succeded: Bool = true
//
//                    operation.request(at: MagicAPI.setsDomain(), decodingType: String.self) { result in
//                        switch result {
//                        case .success(_):
//                            succeded = true
//                        case .error(_):
//                            succeded = false
//                        }
//                    }
//                    
//                    expect(succeded).toNot(beTrue())
//                }
//            }
//
//        }
//    }
//}
