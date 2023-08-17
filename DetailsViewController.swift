//
//  DetailsViewController.swift
//  WWDC18(IHaveThisIdeaForAnApp)
//
//  Created by Denis Azarkov on 27.05.23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!

    var playerInfo: PlayerData?  //хз зачем опционал, а ниже еще защита от нил добавляется
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let playerInfo = playerInfo {
            photoView.image = playerInfo.photo
            nameLabel.text = playerInfo.name
            rankLabel.text = "Rank #\(playerInfo.rank)"
            pointsLabel.text = "\(playerInfo.points) Points"
        }
    }
  
    
    
}
