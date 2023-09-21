//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Abhishek Dhok on 21/09/23.
//

import SwiftUI

struct ProfileView: View {
    // This is used to track which tab is selected.
    @State private var selectedOption: TweetFilterViewModel = .tweets
    // This is used to perform dismiss operation inside profileView
    @Environment(\.dismiss) var dismiss
    // This is used to get animation tweetFilterBar
    @Namespace var animation

    var body: some View {
        VStack(alignment: .leading) {
            headerView

            actionButtons

            userInfoDetails

            tweetFilterBar

            tweetsView

            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
                .frame(height: 96)

            VStack {
                Button {
                   dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }

                Circle()
                    .frame(width: 72, height: 72)
                .offset(CGSize(width: 16, height: 24))
                // We used offset to shift the circle below.
            }
        }
    }

    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            // We used overlay to display circle around the bell.

            Button {

            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }

    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Abhishek Dhok")
                    .font(.title2)
                    .bold()

                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }

            Text("@abhishek143-tech")
                .foregroundColor(.gray)
                .font(.subheadline)

            Text("Pain of descipline.")
                .font(.subheadline)
                .padding(.vertical)

            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Pune, MH")
                }

                HStack {
                    Image(systemName: "link")
                    Text("www.youtube.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)

            HStack(spacing: 24) {
                HStack(spacing: 4) {
                    Text("100")
                        .font(.subheadline)
                        .bold()

                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                HStack(spacing: 4) {
                    Text("100000")
                        .font(.subheadline)
                        .bold()

                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)


        }
        .padding(.horizontal)
    }

    var tweetFilterBar: some View {
        HStack {
            // To use allCases over here we must conform our model with caseIterable protocol.
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedOption == item ? .semibold : .regular)
                        .foregroundColor(selectedOption == item ? .black : .gray)

                    if selectedOption == item {
                        // This is used to get the little link below our selected option inside tweetFilterBar.
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        // This is used the provide the animation in twitFilterBar.
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedOption = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
    }

    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetsRowView()
                        .padding()
                }
            }
        }

    }
}
