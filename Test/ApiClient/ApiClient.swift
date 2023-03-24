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
    
    enum ProfileError: String, Swift.Error{
        case invalidURL = "The profile could not be found"
        case invalidResponse = "Invalid response from the server"
        case invalidData = "The data received from the server was invalid"
    }
    
    func request<ResponseData: Decodable>(
        _type: ResponseData.Type,
        completion: @escaping (Result<ResponseBody<ResponseData>, ApiClient.ProfileError>) -> Void
    ) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            
            guard let self = self else {
                return
            }
            
            print("Start background job \(Thread.isMainThread)")
            guard let url = Bundle.main.url(forResource: "Profile", withExtension: "json") else {
                finish(result: .failure(.invalidURL), completion: completion)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                finish(result: .failure(.invalidData), completion: completion)
                return
            }
            
            guard let responseBody = try? self.decoder.decode(ResponseBody<ResponseData>.self, from: data) else {
                finish(result: .failure(.invalidResponse), completion: completion)
                return
            }
            
            finish(result: .success(responseBody), completion: completion)
            
            print("finish job \(Thread.isMainThread)")
        }
        
    }
    
}

private func finish<ResponseData: Decodable> (
    result: Result<ResponseBody<ResponseData>, ApiClient.ProfileError>,
    completion: @escaping (Result<ResponseBody<ResponseData>, ApiClient.ProfileError>) -> Void)
{
    DispatchQueue.main.async {
        completion(result)
    }
}
