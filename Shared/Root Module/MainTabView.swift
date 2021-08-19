//
//  MainTabView.swift
//  PullRequest Buddy
//
//  Created by Lee Davis on 8/18/21.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var presenter: MainPresenter
    
    
    var body: some View {
        content
    }
    
    
    var content: some View {
        TabView {
            presenter.build(.dashboardView)
                .tabItem { // Modifier
                    Image(systemName: "newspaper")
                    Text("Dashboard")
                }
            presenter.build(.mainReviewListView)
                .tabItem { // Modifier
                    Image(systemName: "house")
                    Text("Home")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(presenter: MainPresenter())
    }
}
