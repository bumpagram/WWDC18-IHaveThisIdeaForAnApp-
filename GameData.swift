//
//  GameData.swift
//  WWDC18(IHaveThisIdeaForAnApp)
//
//  Created by Denis Azarkov on 27.05.23.
//

import UIKit


internal class GameData: NSObject {
    
    internal func savePoints(points: Int, forName: String) {}
    
     internal var numberOfPlayers: Int = 1   //{ get }
// хз прописал сюда 1 чтобы не делать инициализаторы+ в моем прототипе для начала только 1 currentUser

    
    internal func playerData(forRank rank: Int) -> PlayerData {
        return currentUser  // не особо правильно, я сделал руками экземпляр чтобы подогнать пример WWDC под свой случай
    }
   

}
 


