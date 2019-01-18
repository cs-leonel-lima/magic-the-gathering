//
//  Set.swift
//  magic-the-gathering
//
//  Created by isabel.isaura.l.lima on 18/01/2019.
//  Copyright © 2019 leonel.menezes.lima. All rights reserved.
//

import Foundation

struct MTGSet: Decodable {
    let name: String
    let code: String
    var releaseDate: Date?
    
    private enum CodingKeys: CodingKey {
        case name, code, releaseDate
    }
}

extension MTGSet {
    init(from decoder: Decoder) throws {
        let setsContainer = try decoder.container(keyedBy: CodingKeys.self)
        let name = try setsContainer.decode(String.self, forKey: .name)
        let code = try setsContainer.decode(String.self, forKey: .code)
        var releaseDate: Date?
        if let dateString = try? setsContainer.decode(String.self, forKey: .releaseDate) {
            let formatter = DateFormatter.yyyyMMdd
            releaseDate = formatter.date(from: dateString)
        } else {
            releaseDate = nil
        }
        self.init(name: name, code: code, releaseDate: releaseDate)
    }
}

extension MTGSet {
    static func initializeSetsArray(from data: Data) -> [MTGSet]? {
        do {
            let setsDictionary = try JSONDecoder().decode([String: [MTGSet]].self, from: data)
            if let sets = setsDictionary["sets"] {
                return sets
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension MTGSet: Equatable {
    static func == (lhs: MTGSet, rhs: MTGSet) -> Bool {
        return lhs.code == rhs.code
    }
}

extension MTGSet: Comparable {
    static func < (lhs: MTGSet, rhs: MTGSet) -> Bool {
        guard let date1 = lhs.releaseDate, let date2 = rhs.releaseDate else {
            return false
        }
        return date1 < date2
    }
}
