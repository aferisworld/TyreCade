//
//  TCErrors.swift
//  TyreCade
//
//  Created by Nana Aferi on 04/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import Foundation

class TCErrors {
    enum DateError: Error {
        case InvalidTimestamp
        case InvalidDate
        case TcError(error: Any?)
    }
    
    enum TokenError: Error {
        case TokenNotFound
        case InvalidToken
        case TcError(error: Any?)
    }
    
    enum NetWorkError: Error {
        case ServerUnreacheable
        case MalformedURL
        case TcError(error: Any?)
    }
    
    enum DatabaseError: Error {
        case DataNotFound
        case TcError(error: Any?)
    }
    
    enum GenericError: Error {
        case TcError(error: Any?)
    }
    
    enum ValidationError: Error {
        case TcError(error: Any?)
    }
    
    enum DataError: Error {
        case Missing(error: Any?)
        case Incomplete(error: Any?)
    }
}
