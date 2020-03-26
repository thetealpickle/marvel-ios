//
//  ComicDetailView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailView: View {
    var comic: Comic
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    ComicDetailHeaderView()
                        .padding(.bottom, container.size.width * 0.1)
                        .frame(height: container.size.height * 0.3)

                    ComicDetailMetadataView()
                        .environmentObject(self.comic)
                        .frame(height: container.size.height * 0.5)
                    Spacer()
                }
            }

                ComicDetailCycleBarView()
                .frame(height: container.size.height * 0.1)
            }
            .padding(.vertical, container.size.height * 0.07)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(comic: Model.instance.comics[0])
    }
}
