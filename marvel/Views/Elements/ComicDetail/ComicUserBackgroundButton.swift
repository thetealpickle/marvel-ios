//
//  ComicUserBackgroundButton.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicUserBackgroundButton: View {
    var data: ComicUserBackgroundTask
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            HStack(alignment: .center,
                   spacing: container.size.width * 0.03) {
                    Image(systemName: self.data.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, container.size.width * 0.015)
                    RoundedRectangle(cornerRadius: container.size.width * 0.01)
                        .frame(width: container.size.width * 0.01)
                    Text(self.data.title)
                        .font(getHeadlineFontWithContainerSize(container.size.width * 1.25))
                        .fixedSize(horizontal: true, vertical: false)
                    Spacer()
            }
            .padding(.vertical, container.size.height * 0.26)
            .padding(.horizontal)
            .frame(width: container.size.width)
            .background(Color("PrimarySystemColor"))
            .cornerRadius(container.size.width * 0.05)
            .foregroundColor(Color("PrimaryTextColor"))
        }
    }
}

struct ComicUserBackgroundButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { (container: GeometryProxy) in
            ComicUserBackgroundButton(data: SampleData.instance.userBackgroundTasks[0])
                .frame(width: container.size.width,
                       height: container.size.height * 0.15)
        }
    }
}
