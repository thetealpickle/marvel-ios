//
//  ComicTests.swift
//  marvelTests
//
//  Created by Jessica Joseph on 3/29/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

@testable import marvel
import XCTest

class ComicTest: XCTestCase {
    
    let sampleId = 0
    let sampleTitle = "Sample Comic Title"
    let sampleDescription = "Sample Description"
    
    
    func testComicCanBeCreated() {
        let comic = Comic(id: sampleId, title: sampleTitle, description: sampleDescription)
        
        XCTAssertNotNil(comic.id)
        XCTAssertNotNil(comic.description)
        XCTAssertNotNil(comic.title)

        XCTAssertEqual(comic.id!, sampleId)
        XCTAssertEqual(comic.description!, sampleDescription)
        XCTAssertEqual(comic.title!, sampleTitle)
    }
    
    func testComicCanBeCreate() throws {
        
        let jsonDecoder = JSONDecoder()
        let comicJSON: Dictionary<String, Any> = [
            "title": sampleTitle,
            "description": sampleDescription,
            "id": sampleId,
            "extraField": "messy"
        ]
        
        let comicData = try JSONSerialization.data(withJSONObject: comicJSON, options: [])
        let comic = try jsonDecoder.decode(Comic.self, from: comicData)
        
        XCTAssertNotNil(comic.id)
        XCTAssertNotNil(comic.description)
        XCTAssertNotNil(comic.title)

        XCTAssertEqual(comic.id!, sampleId)
        XCTAssertEqual(comic.description!, sampleDescription)
        XCTAssertEqual(comic.title!, sampleTitle)
    }
}
