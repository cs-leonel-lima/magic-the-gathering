//
//  JSONHelper.swift
//  magic-the-gatheringTests
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

class JSONHelper {
    static func getDataFrom(resource name: String) -> Data? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                print(error)
            }
        }
        return nil
    }
}
