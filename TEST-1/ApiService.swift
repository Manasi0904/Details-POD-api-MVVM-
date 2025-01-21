//
//  ApiService.swift
//  TEST-1
//
//  Created by Kumari Mansi on 13/01/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}
    
    func request<T: Decodable>(
        urlString: String,
        method: String,
        headers: [String: String]?,
        body: Data?,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedResponse))
                    } catch let decodingError {
                        print("Decoding Error: \(decodingError)")
                        completion(.failure(decodingError))
                    }
                } else {
                    
                    let errorDescription = String(data: data, encoding: .utf8) ?? "No error message"
                    print("HTTP Error: Status Code \(httpResponse.statusCode), \(errorDescription)")
                    completion(.failure(NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                }

            }
        }.resume()
    }
}


