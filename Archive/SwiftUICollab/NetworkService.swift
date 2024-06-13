//
//  NetworkService.swift
//  SwiftUICollab
//
//  Created by M1 on 12.06.2024.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

public class NetworkService {
    
    public init() {}
    
    public func getData<T: Decodable>(urlString: String, headers: [String: String] = [:], completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.wrongResponse))
            return
        }
        
        var request = URLRequest(url: url)
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.wrongResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(NetworkError.wrongStatusCode(code: response.statusCode)))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}
