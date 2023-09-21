//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by Abhishek Dhok on 21/09/23.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))

                // user info & tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Abhishek Dhok")
                            .font(.subheadline)
                            .bold()

                        Text("@abhishek143-tech")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("2w")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    // tweet caption
                    Text("Pain of descipline")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }

            // Action button
            HStack {
                Button {
                    // Action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    // Action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    // Action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    // Action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

            }
            .padding()

            Divider()
        }
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
