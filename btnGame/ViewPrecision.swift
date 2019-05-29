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
    
    @IBOutlet weak var ig_delay: UILabel!
    @IBOutlet weak var ig_reset: UIButton!
    @IBOutlet weak var ig_start: UIButton!
    @IBOutlet weak var ig_btnStop: UIButton!
    var timeStart:Date?
    var timeEnd:Date?
    var interval = Int.random(in: 1...10)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ig_inter.text = "\(interval)"
        ig_btnStop.alpha = 0
    }
    
    @IBAction func btn_Start(_ sender: Any) {
        timeStart = Date()
        ig_btnStop.alpha = 1
        ig_reset.alpha = 0
        ig_start.alpha = 0
        ig_delay.text = ""
    }
    @IBAction func btn_ResetInterval(_ sender: Any) {
        interval = Int.random(in: 0...10)
        ig_inter.text = "\(interval)"
    }
    
    @IBAction func btn_Stop(_ sender: Any) {
        if let timeStart = timeStart {
            let delay = Date().timeIntervalSince(timeStart)
            ig_delay.text = "\(Int(delay))"
            if Int(delay) == interval{
                ig_resultat.text = "Gagner"
            }else{
                ig_resultat.text = "Perdu"
            }
            
        }
       ig_btnStop.alpha = 0
        ig_start.alpha = 1
        ig_reset.alpha = 1
        
    }
}


