//
//  model.swift
//  TEST-1
//
//  Created by Kumari Mansi on 13/01/25.
//

import Foundation

struct MobileResponse: Codable{
    
        var timestamp: Int
        var access_token: String?
        var token_type: String?
        var refresh_token: String?
        var expires_in: Int?
        var scope: String?
        var status: String
        var authToken: String?
        var mobileNumber: String?
        var profileCompleted: Int
        var customer_id: String
        var customerTier: String?
        var gender: String?
        var message: String
        var block: Bool
        
    }
