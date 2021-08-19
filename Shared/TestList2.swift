//
//  ContentView.swift
//  Shared
//
//  Created by Lee Davis on 8/17/21.
//

import SwiftUI

struct TestList2: View {
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
                    
                    VStack(alignment: .leading) {
                        
                        
                        Text("Number" + presenter.properties.titles.first!)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .foregroundColor(Color("Primary"))
                    
                                    Text("Self Review or PR")
                                        .font(.body)
                                        .foregroundColor(Color("Secondary"))
                                }
//                    ForEach(presenter.properties.titles, id: \.self) { item in
//                        CellView2(item: item)
//                            .onTapGesture {
//                                presenter.didSelectCell(title: item)
//                            }
//                    }
                }
                .navigationTitle("Pull Request")
            }
        }
    }
}

struct TestList2_Previews: PreviewProvider {
    static var previews: some View {
        TestList(presenter: MainPresenter())
            .preferredColorScheme(.dark)
    }
}

struct CellView2: View {
    var item: String
    
    var body: some View {
        Image(systemName: "newspaper")
            .foregroundColor(Color(.systemPink))
//        HStack {
//            VStack(alignment: .leading) {
//                Text("Number" + item)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .lineLimit(1)
//                    .foregroundColor(Color("Primary"))
//
//                Text("Self Review or PR")
//                    .font(.body)
//                    .foregroundColor(Color("Secondary"))
//            }
//
//            Spacer()
//
//
//        }
    }
}
