//
//  ComicListRowView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicListRowView: View {
    @EnvironmentObject var comic: Comic
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            HStack(alignment: .top,
                   spacing: container.size.width * 0.03) {
                    if self.comic.image != nil {
                        Image(uiImage: self.comic.image!)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: container.size.width * 0.25,
                                   height: container.size.height)
                            .clipShape(RoundedRectangle(cornerRadius: container.size.height * 0.2))
                    }
                    VStack(alignment: .leading,
                           spacing: container.size.height * 0.05) {
                        Group {
                            Text(self.comic.title ?? "Comic Title")
                                .font(getHeadlineFontWithContainerSize(container.size.width * 0.9))
                            Text(self.comic.title ?? "Comic Title")
                                .font(getBodyFontWithContainerSize(container.size.width * 0.9))
                        }
                        .foregroundColor(Color("PrimaryTextColor"))
                        Spacer()
                    }
                    .padding(.top, container.size.height * 0.03)
                        
                    
                    Spacer()
            }
            .padding(container.size.height * 0.1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: container.size.height * 0.2)
                    .foregroundColor(Color("SecondarySystemColor"))
            )
        }
    }
}

struct ComicListRowView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { (container: GeometryProxy) in
            
            ComicListRowView()
                .environmentObject(SampleData.instance.comics[0])
                .frame(width: container.size.width * 0.8,
                       height: container.size.height * 0.12)
        }
    }
}
