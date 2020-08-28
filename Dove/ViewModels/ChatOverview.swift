//
//  ChatOverview.swift
//  Dove
//
//  Created by Baskoro Indrayana on 08/28/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

struct ChatOverview: Hashable {
    let id = UUID()
    let recipientName: String
    let recipientImageName: String
    let recentMessage: String
    let messageTimestamp: String
}
