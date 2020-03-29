//
//  ComicListView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicListView: View {
    let comics: [Comic]
    
    init() {
        #if targetEnvironment(simulator)
        self.comics = SampleData.instance.comics
        #else
        self.comics = Model.instance.comics
        #endif
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { (container: GeometryProxy) in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading,
                           spacing: container.size.height * 0.05) {
                            Text("Comic List")
                                .font(getHeadlineFontWithContainerSize(container.size.width))
                                .foregroundColor(Color("PrimaryTextColor"))
                                .padding(.top, container.size.height * 0.07)
                        ForEach(self.comics, id:\.self.id) { comic in
                            NavigationLink(destination: ComicDetailView(comic: comic)) {
                                ComicListRowView()
                                .environmentObject(comic)
                                    .frame(height: container.size.height * 0.1)
                            }
                        }
                        Spacer()
                    }
                    .frame(width: container.size.width * 0.85)
                    
                }
                .padding(.vertical, container.size.height * 0.07)
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
