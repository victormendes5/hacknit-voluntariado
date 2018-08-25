//
//  DetailModel.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import Foundation

public struct DetailModel: Codable {
    public var id: Int
    public var title: String
    public var subTitle: String
    public var date: String
    public var hour: String
    public var place: String
    public var description: String
    public var organizer: String
    public var phone: String
    public var socialMedia: String
    public var tags: String
}
