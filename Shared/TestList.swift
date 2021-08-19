//
//  ContentView.swift
//  Shared
//
//  Created by Lee Davis on 8/17/21.
//

import SwiftUI

struct TestList: View {
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

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList(presenter: MainPresenter())
            .preferredColorScheme(.dark)
    }
}

struct CellView: View {
    var item: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Number" + item)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(Color("Primary"))
                
                Text("Self Review or PR")
                    .font(.body)
                    .foregroundColor(Color("Secondary"))
            }
            
            Spacer()
            
            
            Image(systemName: "newspaper")
                .foregroundColor(Color(.systemPink))
        }
    }
}
