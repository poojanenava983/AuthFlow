//
//  NetworkManager.swift
//  TestLoginFlow
//
//  Created by user on 09/01/23.
//

import Foundation

class NetworkManager {
   
    
    func loginUser(completionHandler: @escaping (UserResponse?, String?) -> Void)
    {
        getData(completionHandler:completionHandler)
    }
    
    private func getData<T:Codable>(completionHandler: @escaping (T?, String?
                                                                  ) -> Void)
    {
        do {
            if let path = Bundle.main.path(forResource: "LoginResponse", ofType: "json")
            {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completionHandler(decoded,nil)
            }
            else
            {
                completionHandler(nil,"decoding failed")
            }
        } catch {
            print("getData \(error.localizedDescription)")
            completionHandler(nil,error.localizedDescription)
        }
    }
}
