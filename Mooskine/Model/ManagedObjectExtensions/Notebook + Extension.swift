//
//  Notebook + Extension.swift
//  Mooskine
//
//  Created by Mac on 12/14/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Notebook{
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
