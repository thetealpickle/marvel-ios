//
//  SampleData.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

/// Mock data objects used for SwiftUI Preview Providers
class SampleData {
    static let instance = SampleData()
    
    let userBackgroundTasks: [ComicUserBackgroundTask] = [
        ComicUserBackgroundTask(id: 0, title: "Add to Library", systemImageName: "checkmark.circle.fill")
    ]
    
    let comics: [Comic] = [
        Comic(id: 0,
              title: "some comic title",
              description: "The Avengers team like you’ve never seen them before. Earths Mightiest Heroes reunite with their biggest guns at the forefront to take on familiar enemies and new threats alike. The instructors at Avengers Academy hope to steer these super-powered and highly-troubled teens in the right direction, but twists and turns abound. Iron Man, Thor, Captain America and the rest of Earths Mightiest Heroes unite to stand against the threats none can face alone.")
    ]
}
