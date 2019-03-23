//
//  FirstExampleViewController.swift
//  WordWrapLabel
//
//  Created by Philipp Otto on 03/23/2019.
//  Copyright (c) 2019. All rights reserved.
//

import UIKit
import WordWrapLabel

class FirstExampleViewController: UIViewController {

    @IBOutlet weak var label1: WordWrapLabel!
    @IBOutlet weak var label2: WordWrapLabel!
    @IBOutlet weak var label3: WordWrapLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label1.text = "Unimaginatively stories"

        self.label2.text = "Unimaginatively stories and antidisestablishmentarianism"

        self.label3.text = "Pseudopseudohypoparathyroidism is an actual English word. And Pneumonoultramicroscopicsilicovolcanoconiosis is even longer"
        
        [self.label1, self.label2, self.label3].forEach { label in
            label!.maximumFontPointSize = 50
            label!.minimumFontPointSize = 10
        }
    }
}

