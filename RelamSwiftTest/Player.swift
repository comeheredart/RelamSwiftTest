//
//  Player.swift
//  RelamSwiftTest
//
//  Created by JEN Lee on 2021/03/02.
//

import Foundation
import RealmSwift

class Player : Object {
    @objc dynamic var name: String = ""
    @objc dynamic var position: String = ""
    @objc dynamic var age: Int = Int()

}
