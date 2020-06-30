//
//  Errors.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 19/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation

enum NasaAppError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
