//
//  APICaller.swift
//  Stocks
//
//  Created by Gaston Seneza on 9/26/21.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "c58e1eaad3ifmjb45la0"
        static let sandBoxApiKey = "sandbox_c58e1eaad3ifmjb45lag"
        static let baseUrl = "https://finnhub.io/api/v1/"
    }
    
    private init() {}
    
    //MARK: - public
    
    public func search(query: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        
        guard let safeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        request(url: url(for: .search, queryParams: ["q": safeQuery]), expecting: SearchResponse.self, completion: completion)
    }
    //get stock info
    //search stocks
    //MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case invalidUrl
        case noDataReturned
    }
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        var urlString = Constants.baseUrl + endpoint.rawValue
        var queryItems = [URLQueryItem]()
        //Add any parameters
        for (name, value) in queryParams {
            queryItems.append(.init(name: name, value: value))
        }
        //Add tokes
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        //Convert query items to suffix string
        urlString += "?" + queryItems.map { "\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        print("\n\(urlString)\n")
        return URL(string: urlString)
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else {
            //Invalid URL
            completion(.failure(APIError.noDataReturned))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                if let error = error {
                    completion(.failure(error))
                }
                return
                
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
