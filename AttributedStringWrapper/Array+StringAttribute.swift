//
//  Array+StringAttribute.swift
//  AttributedStringWrapper
//
//  Created by Henrique Valcanaia on 15/03/19.
//  Copyright © 2019 Henrique Valcanaia. All rights reserved.
//

import Foundation

// Extension do convert a list of AttributedStringAttributeKey
// into a [NSAttributedString.Key:Any]
extension Array where Element == StringAttribute {
    var asDictionary: [NSAttributedString.Key:Any] {
        //        Is this possible? Make any sense?
        //        return reduce(self, +)
        
        var resultDict = first!.asKeyValue
        for keyValueAttribute in self {
            resultDict += keyValueAttribute.asKeyValue
        }
        return resultDict
    }
}
