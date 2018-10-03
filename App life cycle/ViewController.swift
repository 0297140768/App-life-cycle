//
//  ViewController.swift
//  App life cycle
//
//  Created by Татьяна on 03.10.2018.
//  Copyright © 2018 Татьяна. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TextCollectorDeleagate {
    
    @IBOutlet weak var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        TextCollector.ref.delegate = self
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        TextCollector.ref.clear()
    }

}

