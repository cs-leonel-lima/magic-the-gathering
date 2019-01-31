import Quick
import Nimble

@testable import magic_the_gathering

class MagicAPISpec: QuickSpec {
    
    override func spec() {
        
        describe("Magic API") {
            
            context("when mounting routes") {
                
                it("has to correclty mount simple set route") {
                    let mountedRoute = MagicAPI.setsDomain()
                    expect(mountedRoute).to(equal("https://api.magicthegathering.io/v1/sets"))
                }
                
                it("has to correclty mount simple card route") {
                    let mountedRoute = MagicAPI.cardsDomain()
                    expect(mountedRoute).to(equal("https://api.magicthegathering.io/v1/cards"))
                }
                
                it("has to correclty mount set route with parameters") {
                    let params = "lulaLivre=nunca"
                    let mountedRoute = MagicAPI.setsDomain(withParams: params)
                    expect(mountedRoute).to(equal("https://api.magicthegathering.io/v1/sets?lulaLivre=nunca"))
                }
                
                it("has to correclty mount cards route with parameters") {
                    let params = "bolsonaro=impeachment"
                    let mountedRoute = MagicAPI.cardsDomain(withParams: params)
                    expect(mountedRoute).to(equal("https://api.magicthegathering.io/v1/cards?bolsonaro=impeachment"))
                }
            }
        }
    }
    
}
