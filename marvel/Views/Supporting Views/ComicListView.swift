//
//  ComicListView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicListView: View {
    var body: some View {
        NavigationView {
            GeometryReader { (container: GeometryProxy) in
                VStack {
                    ForEach(Model.instance.comics, id:\.self.id) { comic in
                        NavigationLink(destination: ComicDetailView(comic: comic)) {
                            Text(comic.title ?? "not loaded")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct ComicListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicListView()
    }
}
