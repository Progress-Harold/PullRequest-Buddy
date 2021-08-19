//
//  MainListView.swift
//  PullRequest Buddy
//
//  Created by Lee Davis on 8/18/21.
//

import SwiftUI

struct MainListView: View {
    @ObservedObject var presenter: MainPresenter
    
    var body: some View {
        
        content
            .background(Color("Background 1"))
            .onAppear {
                print("Fetching list...")
                presenter.fetchList()
            }
    }
    
    var content: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(presenter.properties.titles, id: \.self) { item in
                        CellView(item: item)
                            .onTapGesture {
                                presenter.didSelectCell(title: item)
                            }
                    }
                }
                .navigationTitle("Pull Requests")
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView(presenter: MainPresenter())
    }
}
