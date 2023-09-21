//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Abhishek Dhok on 21/09/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 25, id:  \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UsersRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            // Used this to shift our navigation title in the top-middle.
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
