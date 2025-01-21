//
//  viewModel.swift
//  TEST-1
//
//  Created by Kumari Mansi on 13/01/25.
//


import Foundation
class ViewModel {
    
    
    private let MobileURL = "https://restaurant-api.reciproci.com/api/ns/customer/v6/update"
    private let headerss: [String: String] = [
        "modifiedTime" : "1736744899578",
        "DEVICE_ID" : "AF6D9830-1617-4F8E-AD68-2D0AE5AE94AD",
        "CITY" : "Noida",
        "COUNTRY" : "India",
        "DEVICE_DETAILS" : "NVNO+oNLjW5j4n3yucvzAFHVoyKM0gGxaLMdRKDVLCqiakhQY5KOC+1z94CHmAJtYIOJEbBQnyWTFQH5ecMOMkzzlQNF2pqE7Loj8MZIFZ+1xBbGYSpYNrgWx5qCa9Re5jzBUv40PYH6JPTWqC1SwtSGE9jcalpIihoPM4dvc+UxS+cIYwbwiKnPsrFh2vk4E0cVL4NP1y2dOyX3Q1+Q0a1yjBuTmXtDq7l92yacClCA1ibXxB7xsn4rZUzHmsJ6jR+7bGvp9Lu2PSVCqyITr1FX5hl09hJJhA5RrYgevD4lWDsnvVqTcXSp8tDFFG",
        "DEVICE_TYPE" : "iOS",
        "Accept-Language" : "EN",
        "APP_VERSION" : "2.1.8.10",
        "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQSVYrbnZtNHhQRGhLTWhzVVJjKy93PT0iLCJpYXQiOjE3MzY3NDQ2ODYsImV4cCI6MTczNjc3MzQ4Nn0.71-myEaJBKQv670nH52R5nAdAfOJL0eSkJEzZcwhuxk"
        
    ]



    func updateUserProfile(firstName: String, lastName: String, email: String, mobileNo: String, address: String, dateOfBirth: String, gender: String, state: String, city: String, completion: @escaping (Result<MobileResponse, Error>) -> Void) {
           
           let body: [String: Any] = [
               "cityOid": 8611,
               "mobileNo": try? mobileNo.aesEncrypt(),
               "lastName": lastName,
               "email": try? email.aesEncrypt(),
               "stateOid": 4,
               "gender": gender,
               "address": address,
               "firstName": firstName,
               "dateOfBirth": dateOfBirth
           ]
           
           guard let bodyData = try? JSONSerialization.data(withJSONObject: body) else { return }
           
           APIService.shared.request(
               urlString: MobileURL,
               method: "POST",
               headers: headerss,
               body: bodyData,
               completion: completion
           )
       }
   }
