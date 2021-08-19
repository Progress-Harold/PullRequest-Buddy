//
//  PullRequest_BuddyApp.swift
//  Shared
//
//  Created by Lee Davis on 8/17/21.
//

import SwiftUI

@main
struct PullRequest_BuddyApp: App {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.scenePhase) var scenePhase
    @ObservedObject var router = MainRouter()

    var body: some Scene {
        WindowGroup {
            
            router.start()
                .animation(.linear)
            
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            case .active:
                print("active")
                // Retrieve user info from cache or check if user is logged in. Check for history.
            @unknown default:
                break
            }
        }
    }
    
    
}

