//
//  ComicUserBackTask.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

struct ComicUserBackgroundTask {
    var id: Int
    var imageName: String
    var title: String
    
    init(id: Int, title: String, systemImageName imageName: String) {
        self.id = id
        self.title = title.uppercased()
        self.imageName = imageName
    }
}
