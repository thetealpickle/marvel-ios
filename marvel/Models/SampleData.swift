//
//  SampleData.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

class SampleData {
    static let instance = SampleData()
    
    let userBackgroundTasks: [ComicUserBackgroundTask] = [
        ComicUserBackgroundTask(id: 0, title: "Add to Library", systemImageName: "checkmark.circle.fill")
    ]
    
    let comics: [Comic] = [
        Comic(id: 0, title: "some comic title", description: "some comics dedscription")
    ]
}
