//
//  ComicDetailMetadataView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailMetadataView: View {
    @EnvironmentObject var comic: Comic
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            VStack(alignment: .leading) {
                Text(self.comic.title ?? "Comic Title")
                RoundedRectangle(cornerRadius: 30.0)
                    .frame(height: 2.5)
                Text(self.comic.description ?? "Comic Description")
                    .fixedSize(horizontal: false, vertical: true)
                HStack(alignment: .center) {
                    ComicDetailSubdataView(title: "Cover")
                        .frame(width: container.size.width * 0.5)
                    ComicDetailSubdataView(title: "Interior")
                        .frame(width: container.size.width * 0.4)
                }
            }
            .padding()
        }
    }
}

struct ComicDetailMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailMetadataView()
    }
}
