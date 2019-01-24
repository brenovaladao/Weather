//
//  Service+Util.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
import Moya
import Result

struct ServiceUtil {
    
    public static func request<T: Codable, K: TargetType>(provider: MoyaProvider<K>, target: K, type: T.Type, _ completion: @escaping(T?, Error?) -> Void) {
        
        provider.request(target) { (result) in
            parseResult(result: result, type: type, completion)
        }
    }
    
    private static func parseResult<T: Codable>(result: Result<Response, MoyaError>, type: T.Type, _ completion: @escaping(_ object: T?, _ error: Error?) -> Void) {
        
        switch result {
        case let .success(response):
            do {
                let object = try response.map(T.self)
                completion(object, nil)
            } catch {
                completion(nil, AppError.objectsMapperError)
            }
        case let .failure(error):
            completion(nil, error)
        }
    }
}
