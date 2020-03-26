//
//  App.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

class App {
    static let instance = App()
    
    private(set) public var userBackgroundTasks: [ComicUserBackgroundTask]
//    public var privateKey: String = ""
    
    init() {
        self.userBackgroundTasks = [
            ComicUserBackgroundTask(id: 0, title: "Mark as Read", systemImageName: "checkmark.circle.fill"),
            ComicUserBackgroundTask(id: 1, title: "Add to Library", systemImageName: "plus.circle.fill"),
            ComicUserBackgroundTask(id: 2, title: "Read Offline", systemImageName: "arrow.down.to.line")
        ]
    }
    
    
}
