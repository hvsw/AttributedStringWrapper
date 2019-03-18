//
//  StringAttribute.swift
//  AttributedStringWrapper
//
//  Created by Henrique Valcanaia on 15/03/19.
//  Copyright © 2019 Henrique Valcanaia. All rights reserved.
//

import UIKit


enum StringAttribute {
    case font(UIFont)
    case foregroundColor(UIColor)
    case backgroundColor(UIColor)
    case ligature(NSNumber)
    case kern(NSNumber)
    case strikethroughStyle(NSNumber)
    case underlineStyle(NSNumber)
    case strokeColor(UIColor)
    case strokeWidth(Float)
    case shadow(NSShadow)
    case textEffect(NSString)
    case attachment(NSTextAttachment)
    case link(NSURL)
    case baselineOffset(NSNumber)
    case underlineColor(UIColor)
    case strikethroughColor(UIColor)
    case obliqueness(NSNumber)
    case expansion(NSNumber)
    case writingDirection([NSNumber])
    case verticalGlyphForm(NSNumber)
    
    public var associated:(label:String, value: Any?) {
        get {
            let mirror = Mirror(reflecting: self)
            if let associated = mirror.children.first {
                return (associated.label!, associated.value)
            }
            print("WARNING: Enum option of \(self) does not have an associated value")
            return ("\(self)", nil)
        }
    }
    
    var asKeyValue: [NSAttributedString.Key:Any] {
        return [self.rawValue:self.associated.value!]
    }
}

// Wait until Swift add auto CaseIterable to enum with associated values
// extension StringAttribute: CaseIterable { }

// Enum encapsulating some NSAttributedString.Key where the
// associated values are the correct expected types instead of Any
extension StringAttribute: RawRepresentable {
    
    typealias RawValue = NSAttributedString.Key
    
    init?(rawValue: NSAttributedString.Key) {
        fatalError("Sorry, we don't want you to init this without having an associated value ")
    }
    
    var rawValue: NSAttributedString.Key {
        switch self {
        case .font(_):
            return .font
        case .foregroundColor(_):
            return .foregroundColor
        case .backgroundColor(_):
            return.backgroundColor
        case .ligature(_):
            return .ligature
        case .kern(_):
            return .kern
        case .strikethroughStyle(_):
            return .strikethroughStyle
        case .underlineStyle(_):
            return .underlineStyle
        case .strokeColor(_):
            return .strokeColor
        case .strokeWidth(_):
            return .strokeWidth
        case .shadow(_):
            return .shadow
        case .textEffect(_):
            return .textEffect
        case .attachment(_):
            return .attachment
        case .link(_):
            return .link
        case .baselineOffset(_):
            return .baselineOffset
        case .underlineColor(_):
            return .underlineColor
        case .strikethroughColor(_):
            return .strikethroughColor
        case .obliqueness(_):
            return .obliqueness
        case .expansion(_):
            return .expansion
        case .writingDirection(_):
            return .writingDirection
        case .verticalGlyphForm(_):
            return .verticalGlyphForm
        }
    }
}

// To use with Set
extension StringAttribute: Hashable {
    public var hashValue: Int {
        // Since we don't care about the associated value, we can simply check if this key is already on this list. Of course, we're considering the key hashValue only, because this is to be used with a Set.
        // A "valid" hash would also take in consideration the associated value
        return self.rawValue.hashValue
    }
}
