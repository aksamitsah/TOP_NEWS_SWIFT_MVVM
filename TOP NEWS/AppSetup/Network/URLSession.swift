//
//  URLSession.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit

class BaseNetworkCall{
    
    enum ResponseError: Error {
        case custom(String)
        case CatchJsonResponse
        case FailureRes
        case NilDataResponse
        case NetworkError
        case InvalidURL
        
        var message: String {
            switch self {
            case .NetworkError: return "Please check internet connection."
            case .CatchJsonResponse: return "Got an error while parsing the json."
            case .FailureRes: return "Got an error from server."
            case .custom(let value): return value
            case .NilDataResponse:  return "Got an Null from server."
            case .InvalidURL: return "Got an URl Error."
                //@unknown default: return ""
            }
        }
    }
    
    public func getResponse(_ url: String, params : [String: String], completion: @escaping (Result< Data, Error>) -> Void ){
        
        //Network Handler
        if !Handler().isConnectedToNetwork(){
            completion(.failure(ResponseError.NetworkError))
            return
        }
        
        var parameter = params
        parameter["apiKey"] = K.APIs.API_KEY
        
        //GET - URL GENERATE
        guard var components = URLComponents(string: url) else{
            completion(.failure(ResponseError.InvalidURL))
            return
        }
        components.queryItems = parameter.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        //components.queryItems = [URLQueryItem(name: "apiKey", value: K.APIs.API_KEY)]
        
        guard let componentURL = components.url else {
            completion(.failure(ResponseError.InvalidURL))
            return
        }
        let request = URLRequest(url: componentURL)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard
                let data = data,                              // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
                error == nil                                  // was there no error
            else {
                debugPrint(String(describing: error))
                completion(.failure(ResponseError.custom(String(describing: error))))
                return
            }
            do{
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? NSDictionary
                
                //Debug print
                debugPrint("URl: ", request)
                debugPrint("Response: ", dictionary as Any)
                
                if dictionary == nil{
                    completion(.failure(ResponseError.CatchJsonResponse))
                    debugPrint("CatchJsonResponse")
                    return
                }
                else{
                    completion(.success(data))
                    debugPrint("sucessful..!")
                    return
                }
            }
            catch {
                // catch error.
                completion(.failure(ResponseError.CatchJsonResponse))
                debugPrint("CatchJsonResponse")
            }
        }
        task.resume()
    }
}
