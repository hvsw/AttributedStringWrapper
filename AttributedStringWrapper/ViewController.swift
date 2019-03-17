//
//  ViewController.swift
//  AttributedStringWrapper
//
//  Created by Henrique Valcanaia on 15/03/19.
//  Copyright © 2019 Henrique Valcanaia. All rights reserved.
//

import UIKit

// This project kinda behaves like NS_EXTENSIBLE_STRING_ENUM, but with associated values
class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: Private Variables
    
    // Here we declare a list of NSAttributedString.Key wiht a much nicer and type safe approach
    private lazy var attributes:[StringAttribute] = [
        .font(.systemFont(ofSize: 100)),
        .backgroundColor(.yellow),
        .strokeWidth(-2),
        .strokeColor(.black),
        .foregroundColor(.white)
    ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private Helpers
    private func setText(repeating: Int) {
        let attrString = NSAttributedString(
            string: String(repeating: "This is a cool text! ", count: repeating),
            attributes: self.attributes
        )
        self.label.attributedText = attrString
    }
    
    // MARK: IBActions
    @IBAction func valueDidChange(_ sender: UISlider) {
        let times = Int(sender.value)
        setText(repeating: times)
    }
    
}
