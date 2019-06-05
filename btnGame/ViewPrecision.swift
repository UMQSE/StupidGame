//
//  ViewPrecision.swift
//  btnGame
//
//  Created by Admin on 28/05/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import UIKit

class ViewPrecision: UIViewController {
    @IBOutlet weak var ig_inter: UILabel!
    
    @IBOutlet weak var ig_resultat: UILabel!
    
    @IBOutlet weak var ig_labelScore: UILabel!
    @IBOutlet weak var ig_labelDif: UILabel!
    @IBOutlet weak var ig_delay: UILabel!
    @IBOutlet weak var ig_reset: UIButton!
    @IBOutlet weak var ig_start: UIButton!
    @IBOutlet weak var ig_btnStop: UIButton!
    var point = UserData().point()
    var timeStart:Date?
    var timeEnd:Date?
    var difficulty = 0.1
    var interval = Double.random(in: 1...10)
    override func viewDidLoad() {
        super.viewDidLoad()
        point = UserData().point()
        ig_labelDif.text = "vous avez selectionné \(difficulty)"
        ig_inter.text = "\(interval)"
        ig_btnStop.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ig_labelScore.text = "vous avez \(point)"
    }
    
    @IBAction func btn_Start(_ sender: Any) {
        if(point>=3){
            point -= 3
            UserData().setPoint(point: point)
            timeStart = Date()
            ig_btnStop.alpha = 1
            ig_reset.alpha = 0
            ig_start.alpha = 0
            ig_delay.text = ""
            ig_resultat.alpha = 0
        }
    }
    @IBAction func btn_ResetInterval(_ sender: Any) {
        interval = Double.random(in: 0...10)
        ig_inter.text = "\(interval)"
    }
    
    @IBAction func btn_changeDif(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            difficulty = 0.1
        case 2:
            difficulty = 0.01
        case 3:
            difficulty = 0.001
        case 4:
            difficulty = 0.0001
        case 5:
            difficulty = 0.0
        default:
            difficulty = 0.1
        }
        ig_labelDif.text = "vous avez selectionné \(difficulty)"
    }
    @IBAction func btn_Stop(_ sender: Any) {
        ig_resultat.alpha = 1
        if let timeStart = timeStart {
            let delay = Date().timeIntervalSince(timeStart)
            ig_delay.text = "\(delay)"
            if (interval-difficulty...interval+difficulty) ~= delay{
                ig_resultat.text = "Gagné"
                switch difficulty{
                case 0.0:
                    point += 20
                   UserData().setPoint(point: point)
                case 0.1:
                    point += 4
                    UserData().setPoint(point: point)
                case 0.01:
                    point += 6
                    UserData().setPoint(point: point)
                case 0.001:
                    point += 10
                    UserData().setPoint(point: point)
                case 0.0001:
                    point += 15
                    UserData().setPoint(point: point)
                default:
                    point += 4
                    UserData().setPoint(point: point)
                }
            }else{
                ig_resultat.text = "Perdu"
            }
            
        }
        ig_btnStop.alpha = 0
        ig_start.alpha = 1
        ig_reset.alpha = 1
        ig_labelScore.text = "vous avez \(UserData().point())"
    }
}


