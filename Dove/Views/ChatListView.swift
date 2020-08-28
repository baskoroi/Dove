//
//  ContentView.swift
//  Dove
//
//  Created by Baskoro Indrayana on 08/26/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    
    var chats: [ChatListItemView] = []
    
    init(chats: [ChatListItemView]) {
        
        self.chats = chats
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chats, id: \.self) { chat in
                    VStack {
                        chat
                        NavigationLink(destination: Text("Chat detail view here")) {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationBarTitle("Chats")
            .navigationBarItems(
                leading: NavigationLink(
                    destination: Text("Edit the chats!"),
                    label: {
                        Text("Edit")
                    }
                ),
                trailing: NavigationLink(
                    destination: Text("Create new chat!"),
                    label: {
                        Image(systemName: "square.and.pencil")
                    }
                )
            )
        }
    }
}

#if DEBUG
struct ChatListView_Previews: PreviewProvider {
    
    static let testChats = [
        ChatListItemView(
            overview: ChatOverview(
                recipientName: "Baskoro #1",
                recipientImageName: "DP",
                recentMessage: "OK Pak, sedang kami proses.",
                messageTimestamp: "12:34AM"
            )
        ),
        ChatListItemView(
            overview: ChatOverview(
                recipientName: "Baskoro #2",
                recipientImageName: "me",
                recentMessage: "OK Pak, sedang kami proses.",
                messageTimestamp: "12:34AM"
            )
        ),
        ChatListItemView(
            overview: ChatOverview(
                recipientName: "Baskoro #3",
                recipientImageName: "me-wwdc20",
                recentMessage: "OK Pak, sedang kami proses.",
                messageTimestamp: "12:34AM"
            )
        )
    ]
    
    static var previews: some View {
        Group {
            ChatListView(chats: testChats)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
                .previewDisplayName("iPhone SE (1st generation)")
            ChatListView(chats: testChats)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
        
        
    }
}
#endif
