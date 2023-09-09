//
//  NetworkManager.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 09/09/23.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = false
    
    init() {
        self.monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.isConnected = true
                } else {
                    self.isConnected = false
                }
            }
        }
        self.monitor.start(queue: queue)
    }
}
