//
//  Errors.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

enum AppError: CustomNSError {

    case objectMapperError
    
    case requestError
    
    var errorCode: Int {
        switch self {
        case .requestError:
            return 9990
        case .objectMapperError:
            return 9991
        }
    }

    var errorUserInfo: [String: Any] {
        let localizableDescription: String
        let localizableFailureRease: String

        switch self {
        case .objectMapperError,
             .requestError:
            localizableDescription = String.genericErrorTitle
            localizableFailureRease = String.genericActualWeatherErrorMessage
        }
        return [NSLocalizedDescriptionKey: localizableDescription,
                NSLocalizedFailureReasonErrorKey: localizableFailureRease]
    }

}
