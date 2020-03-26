//
//  RootView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var stri: String = "loading"
    @State var showMainView: Bool = false
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            ZStack {
                if self.showMainView {
                    ComicListView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text(self.stri)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("PrimarySystemColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                Model.instance.getComics { (error) in
                    if error == nil {
                        self.showMainView = true
                    }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
