//
//  APIError.swift
//  Friend-Face
//
//  Created by Isaque da Silva on 15/06/24.
//

import Foundation

enum Errors: Error, LocalizedError {
    case badURL
    case badResponse
    case badDecoding
    case badGetContent
}
