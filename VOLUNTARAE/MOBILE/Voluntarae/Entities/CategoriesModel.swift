//
//  CategoriesModel.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import Foundation
import Firebase

public struct CategoryModel: Codable {
    public var id: Int
    public var title: String
    public var details: [DetailModel]
}
