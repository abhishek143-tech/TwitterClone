//
//  UsersRowView.swift
//  TwitterClone
//
//  Created by Abhishek Dhok on 21/09/23.
//

import SwiftUI

struct UsersRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text("Abhishek Dhok")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)

                Text("abhishek143-tech")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}

struct UsersRowView_Previews: PreviewProvider {
    static var previews: some View {
        UsersRowView()
    }
}
