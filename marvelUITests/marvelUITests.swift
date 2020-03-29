//
//  marvelUITests.swift
//  marvelUITests
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

@testable import marvel
import XCTest

class marvelUITests: XCTestCase {
    
    let sampleId = 0
    let sampleTitle = "Sample Comic Title"
    let sampleDescription = "Sample Description"
    
    override func setUp() {
    }
    
    func testComicListView() throws {
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["Comic List"].isHittable
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
