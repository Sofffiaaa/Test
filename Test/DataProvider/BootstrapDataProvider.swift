//
//  BootstrapDataProvider.swift
//  Test
//
//  Created by Head HandH on 26.02.2023.
//

import Foundation

final class BootstrapDataProvider {
    
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient){
        self.apiClient = apiClient
    }
    
    private var profile: Profile?
    private var city: City?
    
    private let group = DispatchGroup()
    
    func dataRequest(completion: @escaping (BootstrapData) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            
            guard let self = self else {
                return
            }
            
            self.group.enter()
            self.apiClient.request(_type: ProfileResponseData.self,
                                   url: Bundle.main.url(forResource: "Profile", withExtension: "json")
            ) { result in
                
                switch result {
                case .success(let response):
                    self.profile = response.data?.profile
                case .failure(let error):
                    print("Download error \(error.rawValue)")
                }
                
                self.group.leave()
            }
            
            self.group.enter()
            self.apiClient.request(_type: CityResponseData.self,
                                   url: Bundle.main.url(forResource: "City", withExtension: "json")
            ) { result in
                
                switch result {
                case .success(let response):
                    self.city = response.data?.city
                case .failure(let error):
                    print("Download error \(error.rawValue)")
                }
                
                self.group.leave()
            }
            
            self.group.notify(queue: .main) {
                completion(BootstrapData(profile: self.profile, city: self.city))
            }
            
        }
    }
    
}
