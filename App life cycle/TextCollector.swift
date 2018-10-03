//
//  TextCollector.swift
//  ViewControllerLifeCycleDemo
//
//  Created by Татьяна on 12.09.2018.
//  Copyright © 2018 Татьяна. All rights reserved.
//

import Foundation
import UIKit

protocol TextCollectorDeleagate {
    var textView: UITextView! {get set}
}

struct TextCollector {
    
    var delegate: TextCollectorDeleagate? {
        didSet {
            if let delegate = self.delegate {
                delegate.textView.text = self.text
            }
        }
    }
    
    private var lineNumber: Int {
        get {
            return UserDefaults.standard.integer(forKey: "lineNumber")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "lineNumber")
        }
    }
    private var text: String {
        get {
            return UserDefaults.standard.string(forKey: "TextCollectorString") ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "TextCollectorString")
            if let delegate = self.delegate {
                delegate.textView.text = newValue
            }
        }
    }
    
    private init() {
        
    }
    
    mutating func append(functionName: String) {
        lineNumber += 1
        text = "\(text) \n \(lineNumber). \(functionName)"
    }
    
    mutating func clear() {
        lineNumber = 0
        text = ""
    }
    
    static var ref = TextCollector()
}
