//
//  ComicUserBackgroundTaskListView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicUserBackgroundTaskListView: View {
    
    var taskCount: CGFloat =  CGFloat(App.instance.userBackgroundTasks.count)
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            VStack {
                ForEach(App.instance.userBackgroundTasks, id: \.self.id) { task in
                    ComicUserBackgroundButton(data: task)
                        .frame(height: container.size.height / self.taskCount)
                }
            }
        }
    }
}

struct ComicUserBackgroundTaskListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicUserBackgroundTaskListView()
    }
}
