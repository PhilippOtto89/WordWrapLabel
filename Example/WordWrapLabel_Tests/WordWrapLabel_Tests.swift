//
//  WordWrapLabel_Tests.swift
//  WordWrapLabel_Tests
//
//  Created by Philipp Otto on 24.03.19.
//  Copyright © 2019. All rights reserved.
//

import XCTest
@testable import WordWrapLabel

struct FontSizeTestData {
    
    var labelText: String?
    var startingFontSize: CGFloat
    var minimumFontSize: CGFloat
    var maximumFontSize: CGFloat
    var numberOfLines: Int
    var labelSize: CGSize
    var expectedFontSize: CGFloat
    var expectedMinimumScale: CGFloat
}

class WordWrapLabel_Tests: XCTestCase {

    let fontSizeTests: [FontSizeTestData] = [
        FontSizeTestData(labelText: "Hello World", startingFontSize: 1, minimumFontSize: 10, maximumFontSize: 200, numberOfLines: 1, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 162, expectedMinimumScale: 0.06),
        FontSizeTestData(labelText: "Hello World", startingFontSize: 2, minimumFontSize: 10, maximumFontSize: 200, numberOfLines: 2, labelSize: CGSize(width: 400, height: 40), expectedFontSize: 162, expectedMinimumScale: 0.06),
        FontSizeTestData(labelText: "Hello World", startingFontSize: 3, minimumFontSize: 30, maximumFontSize: 200, numberOfLines: 3, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 162, expectedMinimumScale: 0.18),
        FontSizeTestData(labelText: "Hello World", startingFontSize: 4, minimumFontSize: 10, maximumFontSize: 30, numberOfLines: 4, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 30, expectedMinimumScale: 0.33),
        FontSizeTestData(labelText: "Hello World", startingFontSize: 20, minimumFontSize: 10, maximumFontSize: 30, numberOfLines: 5, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 30, expectedMinimumScale: 0.33),
        FontSizeTestData(labelText: "Hello World with a longer text attached to it", startingFontSize: 8, minimumFontSize: 10, maximumFontSize: 100, numberOfLines: 6, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 100, expectedMinimumScale: 0.1),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 30, minimumFontSize: 10, maximumFontSize: 100, numberOfLines: 7, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 28, expectedMinimumScale: 0.35),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 40, minimumFontSize: 10, maximumFontSize: 20, numberOfLines: 8, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 20, expectedMinimumScale: 0.5),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 40, minimumFontSize: 30, maximumFontSize: 20, numberOfLines: 9, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 20, expectedMinimumScale: 1.0),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 40, minimumFontSize: 40, maximumFontSize: 100, numberOfLines: 10, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 40, expectedMinimumScale: 1.0),
        FontSizeTestData(labelText: nil, startingFontSize: 100, minimumFontSize: 1, maximumFontSize: 200, numberOfLines: 11, labelSize: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 200, expectedMinimumScale: 0.004),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 1000, minimumFontSize: 9, maximumFontSize: 19, numberOfLines: 1, labelSize: CGSize(width: 100, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 9, expectedMinimumScale: 1),
        FontSizeTestData(labelText: "VeryLongWordBarelyFittingALine and some other random stuff", startingFontSize: 1000, minimumFontSize: 9, maximumFontSize: 19, numberOfLines: 1, labelSize: CGSize(width: 1000, height: CGFloat.greatestFiniteMagnitude), expectedFontSize: 19, expectedMinimumScale: 0.47),
    ]
    
    func testAdjustFontSize() {
        let testLabel = WordWrapLabel()
        
        for test in self.fontSizeTests {
            testLabel.frame = CGRect(origin: .zero, size: test.labelSize)
            
            testLabel.text = test.labelText
            testLabel.font = testLabel.font.withSize(test.startingFontSize)
            testLabel.minimumFontPointSize = test.minimumFontSize
            testLabel.maximumFontPointSize = test.maximumFontSize
            testLabel.numberOfLines = test.numberOfLines
            
            testLabel.setNeedsLayout()
            testLabel.layoutIfNeeded()
            
            XCTAssertEqual(testLabel.font.pointSize, test.expectedFontSize)
            XCTAssertEqual(testLabel.minimumScaleFactor, test.expectedMinimumScale, accuracy: 0.01)
        }
    }

    func testAdjustFontSize_Performance() {
        
        self.measure {
            
            let testLabel = WordWrapLabel()
            
            testLabel.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude))
            
            testLabel.text = "VeryLongWordBarelyFittingALine and some other random stuff"
            testLabel.font = testLabel.font.withSize(80)
            testLabel.minimumFontPointSize = 10
            testLabel.maximumFontPointSize = 500
            
            testLabel.setNeedsLayout()
            testLabel.layoutIfNeeded()
        }
    }

}
