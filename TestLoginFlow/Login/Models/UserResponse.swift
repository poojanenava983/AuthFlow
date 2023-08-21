//
//  UserResponse.swift
//  TestLoginFlow
//
//  Created by user on 09/01/23.
//



struct UserResponse: Codable {
    var status:Bool
    var statusCode:Int
    var user:User
}

struct User:Codable {
    var firstName:String
    var lastName:String
    var mobileNumber:String
    var email:String
    
    enum CodingKeys:String, CodingKey
    {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile_number"
        case email = "email"
    }
}


