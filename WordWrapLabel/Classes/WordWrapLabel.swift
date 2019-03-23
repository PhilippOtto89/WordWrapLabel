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
    public var maximumFontPointSize: CGFloat = 100
    
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
        
        let helperLabel = self.getHelperLabel()
        
        helperLabel.font = helperLabel.font.withSize(self.maximumFontPointSize + 1)
        
        repeat {
            
            let currentFontSize = helperLabel.font.pointSize

            helperLabel.font = helperLabel.font.withSize(currentFontSize - 1)
            
            helperLabel.sizeToFit()
            
        } while helperLabel.font.pointSize > self.minimumFontPointSize && helperLabel.bounds.width > self.bounds.width
        
        self.font = self.font.withSize(helperLabel.font.pointSize)
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
