//
//  ApiClient.swift
//  Test
//
//  Created by Head HandH on 03.02.2023.
//

import Foundation


final class ApiClient {
    
    init(decoder: JSONDecoder){
        self.decoder = decoder
    }
    
    private let decoder: JSONDecoder
    
    func profile(completion: @escaping (Result<ResponseBody<ProfileResponseData>, ProfileError>) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            
            guard let self = self else {
                return
            }
            
            print("Start background job \(Thread.isMainThread)")
            guard let url = Bundle.main.url(forResource: "Profile", withExtension: "json") else {
                completion(.failure(.invalidURL))
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                completion(.failure(.invalidData))
                return
            }
            
            if let responseBody = try? self.decoder.decode(ResponseBody<ProfileResponseData>.self, from: data){
                DispatchQueue.main.async {
                    completion(.success(responseBody))
                }
            } else {
                completion(.failure(.invalidResponse))
            }
            
            print("finish job \(Thread.isMainThread)")
        }
        
    }
    
}
