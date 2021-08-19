//
//  MainRouter.swift
//  PullRequest Buddy
//
//  Created by Lee Davis on 8/18/21.
//

import SwiftUI



// Make a delegate w some callbacks in order to communicate w the previous router (if there is one)
//protocol MainRouterDelegate {
//    func showView()
//}
    
final class MainRouter: ObservableObject {
    // Screens enum
    enum MainViewType: String {
        // All the main/ Root Routes
        case dashboardView
        case mainReviewListView
    }
    
    var isOnFirstPass: Bool = true
    
    @Published var currentView: MainViewType = .mainReviewListView
    
    // Start() after creating an instance of the router you can use start in order to use a naviagtion link on a given view and navigate to the routes first View.
    
    func start() -> some View {
        // Logic needed at start
        let presenter = MainPresenter()
        presenter.delegate = self
        
        return MainTabView(presenter: presenter)
    }
    
    func rout(_ screen: MainViewType? = nil) -> AnyView {
        let view = screen ?? currentView
        return build(view)
    }
    
//    func makeDetailView(for trip: Trip, model: DataModel) -> some View {
//      let presenter = TripDetailPresenter(interactor:
//        TripDetailInteractor(
//          trip: trip,
//          model: model,
//          mapInfoProvider: RealMapDataProvider()))
//      return TripDetailView(presenter: presenter)
//    }
    
    // BuildViews w their presenters and interactors
    
    // Route to Router
    
}


// Ext to connect to hook up delegate methods
extension MainRouter: MainPresenterDelegate {
    func showDetailFor(item: String) {
        currentView = .dashboardView
    }
    
    func build(_ screen: MainViewType) -> AnyView {
        switch screen {
        case .dashboardView:
            let presenter = MainPresenter()
            presenter.delegate = self
            
            let view = TestList2(presenter: presenter)
            return AnyView(view)
        case .mainReviewListView:
            let presenter = MainPresenter()
            presenter.delegate = self
            
            let view = MainListView(presenter: presenter)
            return AnyView(view)
        }
    }
}
