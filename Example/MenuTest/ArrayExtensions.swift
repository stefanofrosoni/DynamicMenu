//
//  ArrayExtensions.swift
//  MenuTest
//
//  Created by Stefano Frosoni on 27/02/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import Foundation

extension Array where Element:Equatable {

    func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
