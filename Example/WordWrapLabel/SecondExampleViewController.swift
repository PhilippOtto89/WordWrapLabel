//
//  SecondExampleViewController.swift
//  WordWrapLabel
//
//  Created by Philipp Otto on 03/23/2019.
//  Copyright (c) 2019. All rights reserved.
//

import UIKit
import WordWrapLabel

class SecondExampleViewController: UIViewController {

    @IBOutlet weak var label1: WordWrapLabel!
    @IBOutlet weak var label2: WordWrapLabel!
    @IBOutlet weak var label3: WordWrapLabel!
    @IBOutlet weak var label4: WordWrapLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label1.text = "(4 lines only) Because unimaginatively stories are boring"
        
        self.label2.text = "(3 lines only) Because unimaginatively stories are boring"
        
        self.label3.text = "(80px heigth only) Because unimaginatively stories are boring"
        
        self.label4.text = "(40px height only) Because unimaginatively stories are boring"
        
        [self.label1, self.label2, self.label3, self.label4].forEach { label in
            label!.maximumFontPointSize = 50
            label!.minimumFontPointSize = 10
        }
    }
}

