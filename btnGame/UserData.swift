//
//  UserData.swift
//  btnGame
//
//  Created by Admin on 03/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import Foundation

class UserData{
    func registerDefaultSetting(){
        UserDefaults.standard.register(defaults: ["POINT":10])
    }
    func setPoint(point:Int){
        UserDefaults.standard.set(point, forKey: "POINT")
    }
    func point() -> Int {
        return UserDefaults.standard.integer(forKey: "POINT")
    }
}
