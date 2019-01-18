//
//  CardSpec.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import magic_the_gathering

class CardSpec: QuickSpec {
    
    override func spec() {
        describe("testing card initialization") {
            
            if let path = Bundle.main.path(forResource: "cards", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let json = try JSON(data: data)
                    print(json)
                } catch {
                    print(error)
                    fail()
                }
                
            }
            
        }
    }
    
}
