//
//  Requests.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import Foundation
import Moya

public enum Requests {
    case categories
    case categoriesDetails
}

extension Requests: TargetType {
    public var baseURL: URL {
        return URL(string: "http://voluntaraeapi20180825020524.azurewebsites.net/api")!
    }
    
    public var path: String {
        switch self {
        case .categories:
            return "/category"
        case .categoriesDetails:
            return "/details"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}
