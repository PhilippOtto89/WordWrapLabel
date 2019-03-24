//
//  WordWrapLabel.swift
//  WordWrapLabel_Example
//
//  Created by Philipp Otto on 23.03.19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

open class WordWrapLabel: UILabel {
    
    // MARK: - Public properties
    
    @IBInspectable
    public var maximumFontPointSize: CGFloat = 40
    
    @IBInspectable
    public var minimumFontPointSize: CGFloat = 1
    
    // MARK: - Init
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.commonInit()
    }
    
    open func commonInit() {
        
        self.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        self.adjustFontSize()
        
        self.setMinimumScaleFactor()
    }
    
    // MARK: - Font adjusting
    
    /// This function tries to find the maximum font size with which every word of the label´s text will fit into a single line
    private func adjustFontSize() {
        
        if self.maximumFontPointSize < self.minimumFontPointSize {
            print("WordWrapLabel Warning: maximumFontPointSize should be greater than minimumFontPointSize")
            self.minimumFontPointSize = self.maximumFontPointSize
        }

        let helperLabel = self.getHelperLabel()
        
        // This will be the outcome of the search for a suitable font size
        var adjustmentResultFontSize: CGFloat = self.minimumFontPointSize
        
        // We search for the suitable font size in a binary way (Always try the middle value between current min and max)
        // We use ints here to prevent rounding issues while calculating the font size. Also we dont need floating points anyways
        var currentMax: Int = Int(self.maximumFontPointSize)
        var currentMin: Int = Int(self.minimumFontPointSize)
        
        repeat {

            var middleValue = currentMin + ((currentMax - currentMin) / 2)
            
            helperLabel.font = helperLabel.font.withSize(CGFloat(middleValue))
            
            // We have to reset the bounds before calling sizeToFit to get the proper results because otherwise the text is rendered differently depending on the former bounds
            helperLabel.bounds = CGRect.zero
            helperLabel.sizeToFit()
            
            if helperLabel.bounds.width > self.bounds.width {
                
                if currentMax == middleValue {
                    middleValue -= 1
                }
                
                currentMax = middleValue
            } else {
                
                adjustmentResultFontSize = CGFloat(middleValue)
                
                if currentMin == middleValue {
                    middleValue += 1
                }
                
                currentMin = middleValue
            }
            
        } while currentMin <= currentMax
        
        self.font = self.font.withSize(adjustmentResultFontSize)
    }
    
    private func getHelperLabel() -> UILabel {
        
        let helperLabel = UILabel()
        
        helperLabel.font = self.font
        
        helperLabel.numberOfLines = 0
        
        // Lets put every word of the given text on a separate line. This way we can later find out how much space every word will need
        helperLabel.text = self.text?.replacingOccurrences(of: " ", with: "\n")
        
        return helperLabel
    }
    
    private func setMinimumScaleFactor() {
        
        let currentFontSize = self.font.pointSize
        
        self.minimumScaleFactor = self.minimumFontPointSize / currentFontSize
    }
}
