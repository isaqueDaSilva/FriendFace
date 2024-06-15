//
//  UserDetailsView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI


struct UserDetailsView: View {
    private var viewModel: UserDetailsViewModel
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Circle()
                            .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            .frame(maxWidth: 100)
                            .background {
                                Text(viewModel.isActiveIcon)
                                    .font(.system(size: 50))
                            }
                        
                        VStack(alignment: .leading) {
                            Text("\(viewModel.age) years / \(viewModel.company)")
                                .font(.subheadline.bold())
                            Text(viewModel.adress)
                                .font(.subheadline.bold())
                            Text("\(viewModel.isActive ? "Online" : "Offline")")
                                .font(.headline)
                                .foregroundStyle(.black.opacity(0.5))
                        }
                        .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(viewModel.name)
                        .font(.subheadline.bold())
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Divisor()
                
                VStack(alignment: .leading) {
                    Text("Bio:")
                        .font(.title2.bold())
                    
                    Text(viewModel.about)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divisor()
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("Tags:")
                        .font(.title2.bold())
                        .padding(.bottom)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.tags) {
                                Text($0.tag)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.black.opacity(0.75))
                                    )
                            }
                        }
                        .padding(.bottom)
                    }
                    .scrollBounceBehavior(.basedOnSize)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divisor()
                
                NavigationLink(value: viewModel.friends) {
                    LabeledContent("Friends", value: "\(viewModel.friends.count)")
                        .bold()
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .navigationStackButtonStyle()
                .disabled(viewModel.friends.isEmpty)
                
                Text("Join in: \(viewModel.registered)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.top)
            }
            .navigationBarTitle("User Details")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .navigationDestination(for: [User.Friend].self) { friends in
                FriendListView(friends: friends)
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
    
    init(preview: Bool = false, user: User) {
        self.viewModel = UserDetailsViewModel(user: user)
    }
}

#Preview {
    NavigationStack {
        UserDetailsView(user: User.dummyUser[5])
    }
}
