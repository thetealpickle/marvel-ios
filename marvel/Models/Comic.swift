//
//  Comic.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Combine
import UIKit

class Comic: ObservableObject {
    @Published var image: UIImage?
    
    let id: Int
    
    let description: String
    let title: String

    init(id: Int, title: String, description: String, image: UIImage?) {
        self.image = nil
        
        self.id = id
        self.title = title
        self.description = description
    }
}
