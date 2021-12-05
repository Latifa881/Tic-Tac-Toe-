//
//  ViewController.swift
//  TicTacToe
//
//  Created by administrator on 04/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var whosTurn:Turn = .x
    
    @IBOutlet weak var topLeftBT: UIButton!
    @IBOutlet weak var topMiddelBT: UIButton!
    @IBOutlet weak var topRightBT: UIButton!
    
    @IBOutlet weak var centerLeftBT: UIButton!
    @IBOutlet weak var centerMiddelBT: UIButton!
    @IBOutlet weak var centerRightBT: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var bottomLeftBT: UIButton!
    @IBOutlet weak var bottomMiddelBT: UIButton!
    @IBOutlet weak var bottomRightBT: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.text="X's Turn"
    }
    enum Turn:Int{
        case x = 1
        case o = 2
        
        func getTitle() ->String {
            return self == .x ? "X" : "O"
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        playGame(Button: sender)
    }
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        winnerLabel.text="X's Turn"
        whosTurn = .x
        
        topLeftBT.setTitle("-", for: .normal)
        topLeftBT.backgroundColor=UIColor.systemGray5
        topLeftBT.titleLabel?.font = .systemFont(ofSize: 50)
        topLeftBT.tag = 0
        
        topMiddelBT.setTitle("-", for: .normal)
        topMiddelBT.backgroundColor=UIColor.systemGray5
        topMiddelBT.titleLabel?.font = .systemFont(ofSize: 50)
        topMiddelBT.tag = 0
        
        topRightBT.setTitle("-", for: .normal)
        topRightBT.backgroundColor=UIColor.systemGray5
        topRightBT.titleLabel?.font = .systemFont(ofSize: 50)
        topRightBT.tag = 0
        
        centerLeftBT.setTitle("-", for: .normal)
        centerLeftBT.backgroundColor=UIColor.systemGray5
        centerLeftBT.titleLabel?.font = .systemFont(ofSize: 50)
        centerLeftBT.tag = 0
        
        centerMiddelBT.setTitle("-", for: .normal)
        centerMiddelBT.backgroundColor=UIColor.systemGray5
        centerMiddelBT.titleLabel?.font = .systemFont(ofSize: 50)
        centerMiddelBT.tag = 0
        
        centerRightBT.setTitle("-", for: .normal)
        centerRightBT.backgroundColor=UIColor.systemGray5
        centerRightBT.titleLabel?.font = .systemFont(ofSize: 50)
        centerRightBT.tag = 0
        
        bottomLeftBT.setTitle("-", for: .normal)
        bottomLeftBT.backgroundColor=UIColor.systemGray5
        bottomLeftBT.titleLabel?.font = .systemFont(ofSize: 50)
        bottomLeftBT.tag = 0
        
        bottomMiddelBT.setTitle("-", for: .normal)
        bottomMiddelBT.backgroundColor=UIColor.systemGray5
        bottomMiddelBT.titleLabel?.font = .systemFont(ofSize: 50)
        bottomMiddelBT.tag = 0
        
        bottomRightBT.setTitle("-", for: .normal)
        bottomRightBT.backgroundColor=UIColor.systemGray5
        bottomRightBT.titleLabel?.font = .systemFont(ofSize: 50)
        bottomRightBT.tag = 0
        
    }
    
    func playGame(Button:UIButton){
        //If the tag value is
        //0 it means that the button is still neuteral
        //1 it means X tapped the button
        //2 it means O tapped the button
        
        let buttonSatate = Button.tag
        if buttonSatate == 0{
            Button.tag = whosTurn.rawValue
            Button.setTitle(whosTurn.getTitle(), for: .normal)
            Button.titleLabel?.font = .systemFont(ofSize: 50)
            
            switch (Button.tag){
            case 1:
                Button.backgroundColor=UIColor.red.withAlphaComponent(0.4)
                whosTurn = .o
                winnerLabel.text="O's Turn"
            case 2:
                Button.backgroundColor=UIColor.blue.withAlphaComponent(0.4)
                whosTurn = .x
                winnerLabel.text="X's Turn"
            default:
                bottomMiddelBT.backgroundColor=UIColor.systemGray5
            }
        }
        
        
        checkWinner()
        
    }
    
    func checkWinner(){
        var winnerExists=false
        // Horzintal
        
        if topLeftBT.currentTitle == topMiddelBT.currentTitle
            && topLeftBT.currentTitle == topRightBT.currentTitle &&  topLeftBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topLeftBT.currentTitle ?? "empty string 1")
            winnerExists=true
        }
        
        if centerLeftBT.currentTitle==centerMiddelBT.currentTitle
            && centerLeftBT.currentTitle == centerRightBT.currentTitle &&  centerLeftBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(centerLeftBT.currentTitle ?? "empty string 2")
            winnerExists=true
        }
        
        if bottomLeftBT.currentTitle==bottomMiddelBT.currentTitle
            && bottomLeftBT.currentTitle == bottomRightBT.currentTitle &&  bottomLeftBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(bottomLeftBT.currentTitle ?? "empty string 3")
            winnerExists=true
            
        }
        //Virtical
        
        if topLeftBT.currentTitle==centerLeftBT.currentTitle
            && topLeftBT.currentTitle == bottomLeftBT.currentTitle &&  topLeftBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topLeftBT.currentTitle ?? "empty string 4")
            winnerExists=true
        }
        
        if topMiddelBT.currentTitle == centerMiddelBT.currentTitle
            && topMiddelBT.currentTitle == bottomMiddelBT.currentTitle &&  topMiddelBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topMiddelBT.currentTitle ?? "empty string 5")
            winnerExists=true
        }
        if topRightBT.currentTitle==centerRightBT.currentTitle
            && topRightBT.currentTitle == bottomRightBT.currentTitle &&  topRightBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topRightBT.currentTitle ?? "empty string 6")
            winnerExists=true
        }
        //Diameter
        if topLeftBT.currentTitle==centerMiddelBT.currentTitle
            && topLeftBT.currentTitle == bottomRightBT.currentTitle &&  topLeftBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topLeftBT.currentTitle ?? "empty string 7")
            winnerExists=true
        }
        
        if topRightBT.currentTitle==centerMiddelBT.currentTitle
            && topRightBT.currentTitle == bottomLeftBT.currentTitle &&  topRightBT.titleLabel?.text != "-"{
            
            winnerLabel.text="The winner is "+(topRightBT.currentTitle ?? "empty string 8")
            winnerExists=true
        }
     
        
        if ( topLeftBT.titleLabel?.text != "-"
             && topMiddelBT.titleLabel?.text != "-"
             && topRightBT.titleLabel?.text != "-"
             && centerLeftBT.titleLabel?.text != "-"
             && centerMiddelBT.titleLabel?.text != "-"
             && centerRightBT.titleLabel?.text != "-"
             && bottomLeftBT.titleLabel?.text != "-"
             && bottomMiddelBT.titleLabel?.text != "-"
             && bottomRightBT.titleLabel?.text != "-"
             && winnerExists == false ){
            
            winnerLabel.text="The game ended with tie :)"
        }
        
    }
    
}


