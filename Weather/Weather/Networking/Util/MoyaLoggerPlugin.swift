//
//  MoyaLoggerPlugin.swift
//  Weather
//
//  Created by Breno Vinícios on 21/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Moya
import Result

final class LoggerPlugin: PluginType {

#if DEBUG
    private var logData: Bool = true
#else
    private var logData: Bool = false
#endif

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
        guard logData else { return }
        
        let logParams = """
        \n\n ===============================================
        \n URL: \(target.method.rawValue.uppercased()) - \(target.baseURL)/\(target.path)
        \n Headers: \(target.headers?.description ?? "")
        \n Task: \(target.task)
        """
        print(logParams)
        
        switch result {
        case let .success(response):
            do {
                let data = try response.mapJSON()
                print("\n\n Result Data: \(data)\n")
            } catch {
                let dataString = try? response.mapString()
                let printableError = error as CustomStringConvertible
                print("\n\n Error: \(printableError)\n ==== Data ==== \n\n\(dataString ?? "")")
            }
        case let .failure(error):
            print("\n\n Error: \(error)\n")
        }
    }
    
}
