//
//  PlayerData.swift
//  WWDC18(IHaveThisIdeaForAnApp)
//
//  Created by Denis Azarkov on 27.05.23.
//

import UIKit

class PlayerData: NSObject {

    let name: String
    var points: Int
    var rank : Int
    var photo : UIImage?
   
    init(name: String, points: Int, rank: Int, photo: UIImage? = nil) {
        self.name = name
        self.points = points
        self.rank = rank
        self.photo = photo  // для опционала инит не обязательный
    }
    
    
}


let currentUser = PlayerData.init(name: "testUser", points: 0, rank: 1)
