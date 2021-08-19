//
//  MainInteractor.swift
//  PullRequest Buddy
//
//  Created by Lee Davis on 8/18/21.
//

protocol MainInteractorDelegate {
    func trackSuccefullyGrabbedData()
}

protocol MainInteractorInterface {
    func fetchList(completion: @escaping([String])->())
}

final class MainInteractor: MainInteractorInterface {
    // MARK: - Singletons
    // Network Manager
    // API
    // Tracking
 
    // Hook up presenter delegate
    var delegate: MainInteractorDelegate?
    
    init() {}
    
    // MARK: - Communication | FetchMethods
    
    func fetchList(completion: @escaping([String])->()) {
        let list = ["VIP-102 Initial Commit", "VIP-122 Adding Presenters", "VIP-102 Building View and View Properties", "VIP-2222"]
        
        delegate?.trackSuccefullyGrabbedData()
        completion(list)
    }
}
