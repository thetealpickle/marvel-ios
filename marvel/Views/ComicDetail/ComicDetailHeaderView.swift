//
//  ComicDetailHeaderView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailHeaderView: View {
    @EnvironmentObject var comic: Comic
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            ZStack {
                if self.comic.image != nil {
                    Image(uiImage: self.comic.image!)
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(height: container.size.height)
                        .blur(radius: 15.0)
                }
                HStack(alignment: .center) {
                    if self.comic.image != nil {
                        Image(uiImage: self.comic.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    GeometryReader { (actionContainer: GeometryProxy) in
                        VStack {
                            Button(action: {
                                print("read now HUMANNNN")
                            }) {
                                Text("READ NOW")
                                    .font(getHeadlineFontWithContainerSize(container.size.width))
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(Color("PrimaryTextColor"))
                            }
                            .padding()
                            .frame(width: actionContainer.size.width)
                            .background(Color("AccentColor"))
                            
                            ComicUserBackgroundTaskListView()
                        }
                    }
                }
                .frame(height: container.size.height * 0.9)
            }
            .padding()
            .frame(width: container.size.width,
                   height: container.size.height)
        }
    }
}

struct ComicDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { (container: GeometryProxy) in
            ComicDetailHeaderView()
                .environmentObject(SampleData.instance.comics[0])
                .frame(height: container.size.height * 0.3)
            
        }
    }
}
