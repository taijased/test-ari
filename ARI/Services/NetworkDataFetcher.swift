//
//  NetworkDataFetcher.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation


protocol DataFetcher {
    func getUser(socialName: String, response: @escaping (UserResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    private let authService: AuthService
    let networking: Networking
    
    
    init(networking: Networking, authService: AuthService = AppDelegate.shared().authService) {
        self.networking = networking
        self.authService = authService
    }
    
    func getUser(socialName: String, response: @escaping (UserResponse?) -> Void) {
        switch socialName {
        case "vk":
    
            guard let userId = authService.userId else { return }
            
            let params = ["user_ids": userId, "fields": "first_name, last_name, sex, photo_100, bdate, city"]
            
            networking.request(path: API.user, params: params) { (data, error) in
                if let error = error {
                    print("Error received requesting data: \(error.localizedDescription)")
                    response(nil)
                }
                let decoded = self.decodeJSON(type: UserResponseWrapped.self, from: data)
//                print(decoded?.response.first)
                response(decoded?.response.first)
            }
        case "google":
            print(socialName)
            
        default:
            response(nil)
            break
        }
    }
    
    
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard
            let data = from,
            let response = try? decoder.decode(type.self, from: data)
            else { return nil }
        //        do {
        //            let response = try decoder.decode(type.self, from: data)
        //
        //            print("response \(response)")
        //        } catch DecodingError.dataCorrupted(let context) {
        //            print(DecodingError.dataCorrupted(context))
        //        } catch DecodingError.keyNotFound(let key, let context) {
        //            print(DecodingError.keyNotFound(key,context))
        //        } catch DecodingError.typeMismatch(let type, let context) {
        //            print(DecodingError.typeMismatch(type,context))
        //        } catch DecodingError.valueNotFound(let value, let context) {
        //            print(DecodingError.valueNotFound(value,context))
        //        } catch let error{
        //            print(error)
        //        }
        
        return response
    }
}
