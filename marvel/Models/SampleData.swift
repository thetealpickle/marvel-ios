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
    
    let userBackgroundTasks: [ComicUserBackTask] = [
        ComicUserBackTask(title: "Add to Library", systemImageName: "checkmark.circle.fill")
    ]
}
