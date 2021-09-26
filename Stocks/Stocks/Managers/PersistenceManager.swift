//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Gaston Seneza on 9/26/21.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        
    }
    private init() {}
    
    //MARK: - Public
    public var watchList: [String] {
        return []
    }
    public func addToWatchList() {
        
    }
    public func removeFromWatchList() {
        
    }
    
    //MARK: -Private
    private var hasOnboarded: Bool {
        return false
    }
}
