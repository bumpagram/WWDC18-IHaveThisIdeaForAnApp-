//
//  LeaderboardViewController.swift
//  WWDC18(IHaveThisIdeaForAnApp)
//
//  Created by Denis Azarkov on 27.05.23.
//

import UIKit

class LeaderboardViewController: UITableViewController {
    let gameData = GameData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameData.numberOfPlayers  // даст нам итоговое количество строк
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let playerRank = indexPath.row  // даст ранг игрока
        let playerInfo = gameData.playerData(forRank: playerRank)

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let playerRank = tableView.indexPathForSelectedRow!.row
        let playerDetails = gameData.playerData(forRank: playerRank)
        let detailsVC = segue.destination as! DetailsViewController  
        detailsVC.playerInfo = playerDetails
    }

    
    
} // ViewController end
