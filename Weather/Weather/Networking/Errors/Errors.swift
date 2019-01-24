//
//  Errors.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

enum AppError: CustomNSError {

    case objectsMapperError
    
    var errorCode: Int {
        switch self {
        case .objectsMapperError:
            return 9990
        }
    }

    var errorUserInfo: [String: Any] {
        let localizableDescription: String
        let localizableFailureRease: String

        switch self {
        case .objectsMapperError:
            localizableDescription = String.genericErrorTitle
            localizableFailureRease = String.genericActualWeatherErrorMessage
        }
        return [NSLocalizedDescriptionKey: localizableDescription,
                NSLocalizedFailureReasonErrorKey: localizableFailureRease]
    }

}
