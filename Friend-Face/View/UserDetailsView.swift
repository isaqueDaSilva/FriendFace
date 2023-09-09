//
//  UserDetailsView.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 08/09/23.
//

import SwiftUI


struct UserDetailsView: View {
    @StateObject var viewModel = UserDetailsViewModel()
    let user: Users?
    let userByCoreData: CachedUsers?
    var body: some View {
        ScrollView {
            // User Information
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                        
                        VStack {
                            Text("\(((user != nil ? user?.isActive : userByCoreData?.isActive) ?? false) ? "😎" : "😴")")
                                .font(.system(size: 50))
                        }
                    }
                    .frame(maxWidth: 100)
                    
                    Text(user != nil ? user?.name ?? "" : userByCoreData?.wrappedName ?? "")
                        .font(.headline.bold())
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("\(user != nil ? Int16(user?.age ?? 0) : userByCoreData?.age ?? 0) years / \(user != nil ? user?.company ?? "" : userByCoreData?.wrappedCompany ?? "")")
                        .font(.subheadline.bold())
                    Text(user != nil ? user?.address ?? "" : userByCoreData?.wrappedAddress ?? "")
                        .font(.subheadline.bold())
                    Text("\(((user != nil ? user?.isActive : userByCoreData?.isActive) ?? false) ? "Online" : "Offline")")
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
                
                Text(user != nil ? user?.about ?? "" : userByCoreData?.wrappedAbout ?? "")
                .padding(.horizontal)
            }
            
            Divisor()
                .padding([.top, .horizontal])
            
            // User Tags
            VStack(alignment: .leading) {
                Text("Tags:")
                    .font(.title2.bold())
                    .padding(.bottom)
                if user != nil {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user?.tags ?? [], id: \.self) {
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
                } else {
                    Text("Connect the internet to get that user's tags!")
                        .font(.callout.bold())
                }
            }

            
            Divisor()
                .padding(.horizontal)
            
            // Friend List
            NavigationLink {
                FriendListView(user: user)
            } label: {
                HStack {
                    Text("Friends")
                        .font(.headline)
                    Spacer()
                    if user != nil {
                        Text("\(user?.friends.count ?? 0)")
                            .font(.headline.bold())
                    } else {
                        Image(systemName: "wifi.slash")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.black.opacity(0.5))
                .padding(.horizontal)
            }
            
            // Registrado em:
            Text("Join in: \(viewModel.dateFormatter.string(from: user != nil ? user?.registered ?? Date.now : userByCoreData?.wrappedregistered ?? Date.now))")
                .font(.headline)
                .foregroundColor(.black.opacity(0.5))
                .padding(.top)
        }
        .navigationBarTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
