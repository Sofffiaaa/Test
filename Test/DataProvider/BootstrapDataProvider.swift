//
//  BootstrapDataProvider.swift
//  Test
//
//  Created by Head HandH on 26.02.2023.
//

import Foundation

final class BootstrapDataProvider {
    
    init(apiClient: ApiClient){
        self.apiClient = apiClient
    }
    
    private let apiClient: ApiClient
    
    private let group = DispatchGroup()
    
   /* func dataRequest(completion: @escaping (Result<(profile: Profile, city: City), Swift.Error>) -> Void) {
        
        var profileResult: Result<ResponseBody<ProfileResponseData>, ApiClient.ProfileError>?
        var cityResult: Result<ResponseBody<ProfileResponseData>, ApiClient.ProfileError>?
        
        group.enter()
        apiClient.request(_type: ProfileResponseData.self) { result in
            profileResult = result
            
            profileResult = .success(<#ResponseBody<ProfileResponseData>#>)
            self.group.leave()
            
        }
        
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            apiClient.request(_type: ProfileResponseData.self) { result in
                cityResult = result
                cityResult = .success(<#T##ResponseBody<ProfileResponseData>#>)
            }
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            switch (profileResult, cityResult) {
            case
            }
        }
        
    }*/
}


