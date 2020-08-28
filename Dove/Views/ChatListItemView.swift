//
//  ChatListItemView.swift
//  Dove
//
//  Created by Baskoro Indrayana on 08/28/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import SwiftUI

struct ChatListItemView: View, Hashable {
    static func == (lhs: ChatListItemView, rhs: ChatListItemView) -> Bool {
        return lhs.overview.id == rhs.overview.id
    }
    
    let overview: ChatOverview
    
    let imageWidth: CGFloat = 60
    
    var body: some View {
        HStack {
            Image(overview.recipientImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageWidth, height: imageWidth, alignment: .center)
                .cornerRadius(imageWidth / 2)
                .padding(.horizontal, 8)
            VStack(alignment: .leading) {
                Text(overview.recipientName)
                    .font(.headline)
                Text(overview.recentMessage)
                    .font(.subheadline)
                Text(overview.messageTimestamp)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            Spacer()
        }.frame(minWidth: 0, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: imageWidth, idealHeight: imageWidth, maxHeight: imageWidth, alignment: .top)
    }
}

#if DEBUG
struct ChatListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListItemView(
            overview: ChatOverview(
                recipientName: "Baskoro",
                recipientImageName: "DP",
                recentMessage: "OK Pak, sedang kami proses.",
                messageTimestamp: "12:34AM"
            )
        )
    }
}
#endif
