//
//  UserMainView.swift
//  FriendFace
//
//  Created by Isaque da Silva on 01/09/23.
//

import SwiftUI

struct UserMainView: View {
    @StateObject var viewModel = UserMainViewModel()
    let user: User
    
    var body: some View {
        ScrollView {
            // User Information
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                        
                        VStack {
                            Text("\(user.isActive ? "😎" : "😴")")
                                .font(.system(size: 50))
                        }
                    }
                    .frame(maxWidth: 100)
                    
                    Text(user.name)
                        .font(.headline.bold())
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("\(user.age) years / \(user.company)")
                        .font(.subheadline.bold())
                    Text(user.address)
                        .font(.subheadline.bold())
                    Text("\(user.isActive ? "Online" : "Offline")")
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.5))
                }
                Spacer()
            }
            
            Divisor()
                .padding(.horizontal)
            
            // User Bio
            VStack(alignment: .leading) {
                Text("Bio:")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                Text(user.about)
                .font(.headline.bold())
                .padding(.horizontal)
            }
            
            Divisor()
                .padding([.top, .horizontal])
            
            // User Tags
            VStack(alignment: .leading) {
                Text("Tags:")
                    .font(.title2.bold())
                    .padding([.horizontal, .bottom])
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(user.tags, id: \.self) {
                            Text($0)
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(8)
                                .foregroundColor(.white)
                                .background(.black.opacity(0.75))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                }
            }

            
            Divisor()
                .padding(.horizontal)
            
            // Friend List
            NavigationLink {
                FriendsListView(user: user)
            } label: {
                HStack {
                    Text("Friends")
                        .font(.headline)
                    Spacer()
                    Text("\(user.friends.count)")
                        .font(.headline.bold())
                }
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.black.opacity(0.5))
                .padding(.horizontal)
            }
            
            // Registrado em:
            Text("Join in: \(viewModel.dateFormatter.string(from: user.registered))")
                .font(.headline)
                .foregroundColor(.black.opacity(0.5))
                .padding(.top)
        }
        .navigationBarTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
