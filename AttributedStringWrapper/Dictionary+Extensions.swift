//
//  Dictionary+Extensions.swift
//  AttributedStringWrapper
//
//  Created by Henrique Valcanaia on 15/03/19.
//  Copyright © 2019 Henrique Valcanaia. All rights reserved.
//

import Foundation

// Operator to perform += with dictionaries
func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}
