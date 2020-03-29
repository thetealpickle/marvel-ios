//
//  ModelTests.swift
//  marvelTests
//
//  Created by Jessica Joseph on 3/29/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

@testable import marvel
import XCTest

class ModelTests: XCTestCase {
    
    func testComicsCanBePopulated() throws {
        #if targetEnvironment(simulator)
        XCTAssertEqual(Model.instance.comics.count, 1)
        #else
        XCTAssertEqual(Model.instance.comics.count, 0)
        #endif
        
        Model.instance.getComics { (success, error) in
         
            XCTAssertNil(error)
            XCTAssertTrue(success)
            XCTAssertNotEqual(Model.instance.comics.count, 0)
        }
    }    
}
