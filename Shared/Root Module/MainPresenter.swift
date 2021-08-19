//
//  MainPresenter.swift
//  PullRequest Buddy
//
//  Created by Lee Davis on 8/18/21.
//

import SwiftUI

protocol MainPresenterDelegate {
    func showDetailFor(item: String)
    func build(_ screen: MainRouter.MainViewType) -> AnyView
}

final class MainPresenter: ObservableObject {
    var delegate: MainPresenterDelegate?
    @Published var properties: Properties = .defualt
    private var interactor: MainInteractorInterface = MainInteractor()
    
    func fetchList() {
        DispatchQueue.main.async {
            self.interactor.fetchList { list in
                self.properties = .init(titles: list)
            }
        }
    }
    
    func didSelectCell(title: String) {
        delegate?.showDetailFor(item: title)
    }
    
    func build(_ screen: MainRouter.MainViewType) -> AnyView? {
        return delegate?.build(screen)
    }
}

extension MainPresenter {
    final class Properties: ObservableObject {
        @Published var titles: [String]
        
        static var `defualt` = Properties(titles: [""])
        
        init(titles: [String]) {
            self.titles = titles
        }
    }
}
