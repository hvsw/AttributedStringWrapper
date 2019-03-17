//
//  NSAttributedString+StringAttribute.swift
//  AttributedStringWrapper
//
//  Created by Henrique Valcanaia on 15/03/19.
//  Copyright © 2019 Henrique Valcanaia. All rights reserved.
//

import Foundation

// Custom init to work with a list of attributes
extension NSAttributedString {
    convenience init(string: String, attributes: [StringAttribute]) {
        self.init(string: string, attributes: attributes.asDictionary)
    }
}
