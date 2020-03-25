//
//  ComicUserBackTask.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

struct ComicUserBackTask {
    var imageName: String
    var title: String
    
    init(title: String, systemImageName imageName: String) {
        self.title = title.uppercased()
        self.imageName = imageName
    }
}
