//
//  Error.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 24.05.2024.
//

import Foundation

public enum DataError : Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    case connectionError
    
    var description : String {
        switch self {
        case .apiError :             return "Ошибка получения данных"
        case .invalidEndpoint :      return "Ошибка в методе API"
        case .invalidResponse :      return "Неверный ответ сервера"
        case .noData :               return "Нет данных"
        case .serializationError :   return "Ошибка преобразования данных"
        case .connectionError:       return "Пожалуйста, проверьте ваше подключение к сети"
        }
    }
    
    public var errorUserInfo : [String : Any] {
        [NSLocalizedDescriptionKey : description]
    }
}
//(Result<D, DataError>)->())
