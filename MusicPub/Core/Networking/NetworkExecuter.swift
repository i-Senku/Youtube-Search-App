//
//  NetworkExecuter.swift
//  MVVM_test
//
//  Created by Ercan Garip on 13.09.2021.
//

import Foundation
import UIKit

struct NetworkExecuter {
    
    static var shared = NetworkExecuter()
    
    
    func execute<T: Decodable>(
        route: BaseClientGenerator,
        responseModel : T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        print("🍕Route: \(route) -- method: \(route.method.rawValue)")
        
        do {
            let urlRequest = try route.asURLRequest()
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ data,response,error in
                
                guard error == nil else {
                    DispatchQueue.main.async {
                        completion(.failure(.badRequest))
                        
                    }
                    return
                }

                guard let response = response else {
                    completion(.failure(.noResponse))
                    return
                }
                handleResponse(response: response, completion: completion,data: data)
            }
            dataTask.resume()
            
        } catch{
            DispatchQueue.main.async {
                completion(.failure(.invalidURL))
            }
        }
    }
    
    
    // MARK: - Handle Response
    private func handleResponse<T : Decodable>(response : URLResponse,completion: @escaping (Result<T, NetworkError>) -> Void,data : Data?){
        
        //MARK: - Convert to HTTPURLResponse
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(.failure(.responseConvert))
            return
        }
        
        //MARK: - Control Status Code
        switch httpResponse.statusCode {
        case 200...300 :
            do {
                //MARK: - Is Data Available
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                //MARK: - Decode to Model
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodeError))
                }
            }
            break
        default:
            DispatchQueue.main.async {
                completion(.failure(.request(statusCode: httpResponse.statusCode, data: data)))
            }
        }
    }
    
}


