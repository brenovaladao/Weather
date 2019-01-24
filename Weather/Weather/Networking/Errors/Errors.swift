//
//  Errors.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation
//
//enum AppError: Error {
//
//}

extension NSError {

    static let actualWeatherRequestError = NSError(domain: AppDefaults.errorDomain,
                                                   code: 9990,
                                                   userInfo: [NSLocalizedDescriptionKey: String.genericErrorTitle,
                                                              NSLocalizedFailureReasonErrorKey: String.genericActualWeatherErrorMessage])
    
}
