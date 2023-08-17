//
//  ViewController.swift
//  WWDC18(IHaveThisIdeaForAnApp)
//
//  Created by Denis Azarkov on 25.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var badButton: UIButton!
    @IBOutlet var leaderboardButton: UIButton!
    @IBOutlet var pointsLabel: UILabel!
    
    var gameButtonsArray = [UIButton]()
    var playerPoints = 0
    var currentGamestate = GameState.gameOver
    
    enum GameState {
        case gameOver
        case playing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pointsLabel.isHidden = true
        gameButtonsArray = [goodButton, badButton]
        setupFreshGameState()
    }

    @IBAction func startPressed(_ sender: Any) {
        currentGamestate = .playing
        startNewGame()
    }
    @IBAction func goodPressed(_ sender: Any) {
        playerPoints += 1
        willUpdatePointsLabel(insert: playerPoints)
        goodButton.isHidden = true
        tapTimer?.invalidate()   // отменяет таймер
        oneMoreGameRound()
    }
    @IBAction func badPressed(_ sender: Any) {
        badButton.isHidden = true
        tapTimer?.invalidate()
        willGameOver()
    }
    
    var tapTimer : Timer?
    var currentDisplayedButton : UIButton!
    
    
    func startNewGame() {
        startGameButton.isHidden = true
        leaderboardButton.isHidden = true
        playerPoints = 0
        willUpdatePointsLabel(insert: playerPoints)
        pointsLabel.textColor = .magenta
        pointsLabel.isHidden = false
        oneMoreGameRound()
    }
    func willUpdatePointsLabel(insert: Int) {
        pointsLabel.text = String(insert)
    }
    func oneMoreGameRound() {
        willUpdatePointsLabel(insert: playerPoints)
        displayRandomButton()
        
        tapTimer = .scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
            if self.currentGamestate == .playing {
                if self.currentDisplayedButton == self.goodButton {
                    // если выведенная чз рандом юзеру кнопка-хорошая, а секунда уже прошла, тогда он проиграл
                    self.willGameOver()
                }
                else {  self.oneMoreGameRound() }
            }
        })
        
    }
    func willGameOver() {
        currentGamestate = .gameOver
        pointsLabel.textColor = .brown
        setupFreshGameState()
        let gameData = GameData()
        gameData.savePoints(points: playerPoints, forName: currentUser.name)  // сюда надо будет передавать итоги игры
    }
    func displayRandomButton() {
        for btn in gameButtonsArray {
            btn.isHidden = true
        }
        let buttonIndexForShow = Int.random(in: 0..<gameButtonsArray.count)
        currentDisplayedButton = gameButtonsArray[buttonIndexForShow]
        currentDisplayedButton.center = CGPoint(x: setRandomX(), y: setRandomY())
        currentDisplayedButton.isHidden = false
    }
    
    func setupFreshGameState() {  //это возврат в состояние главного меню
        startGameButton.isHidden = false
        leaderboardButton.isHidden = false
        currentDisplayedButton = goodButton
        currentGamestate = .gameOver
        pointsLabel.alpha = 0.15
        for i in gameButtonsArray {
            i.isHidden = true
        }
    }
    func getRandomCGF(_ minvalue: CGFloat, _ maxvalue: CGFloat) -> CGFloat {
        return CGFloat.random(in: minvalue..<maxvalue)
    }
    func setRandomX()-> CGFloat {
        // это не сам придумал, по сути с WWDC втупую переписал, почти не понимаю что здесь
        let leftside = view.safeAreaInsets.left + currentDisplayedButton.bounds.width
        let rightside = view.bounds.width - view.safeAreaInsets.right - currentDisplayedButton.bounds.width
        return getRandomCGF(leftside, rightside)
    }
    func setRandomY()-> CGFloat {
        // это не сам придумал, по сути с WWDC втупую переписал, почти не понимаю что здесь
        let topside = view.safeAreaInsets.top + currentDisplayedButton.bounds.height
        let bottomside = view.bounds.height - view.safeAreaInsets.bottom - currentDisplayedButton.bounds.height
        return getRandomCGF(topside, bottomside)
    }
      
    
    
    
    
    
} // ViewController end

