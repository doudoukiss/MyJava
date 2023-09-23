//
//  RMAPICacheManager.swift
//  RickAndMorty
//
//  Created by Seattle on 2023/9/21.
//

import Foundation

/// Manages in memory session scoped API caches
final class RMAPICacheManager {
    // API URL:Data
    /// Cache map
    private var cacheDictionary: [
        RMEndpoint: NSCache<NSString, NSData>
    ] = [:]
    /// Constructor
    init() {
        setUpCache()
    }
    
    // MARK: - Public
    
    /// Get cache API response
    /// - Parameters:
    ///     -endpoint: Endpoint to cache for
    ///           -url: url key
    ///           -return: Nullable data
    public func cachedResponse(for endpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    /// Set API response caceh
    ///  - Parameters:  endpoint, url, data
    public func setCache(for endpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    // MARK: - Private
    /// Set up dictionary
    private func setUpCache() {
        RMEndpoint.allCases.forEach({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}
