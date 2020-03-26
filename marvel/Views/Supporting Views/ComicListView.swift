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
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(Model.instance.comics, id:\.self.id) { comic in
                            NavigationLink(destination: ComicDetailView(comic: comic)) {
                                Text(comic.title ?? "not loaded")
                                .padding()
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                .padding(.vertical, container.size.height * 0.1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("PrimarySystemColor"))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ComicListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicListView()
    }
}
