//
//  RootView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var stri: String = "loading data"
    @State var showMainView: Bool = false

    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            ZStack {
                if self.showMainView {
                    ComicListView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text(self.stri)
                        .font(getHeadlineFontWithContainerSize(container.size.width))
                    .foregroundColor(Color("PrimaryTextColor"))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("PrimarySystemColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                Model.instance.getComics { (success, error) in
                    if error != nil {
                        self.stri = "error loading data 😢 \n check your network and try again"
                    }
                    
                    if success {
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
