//
//  ViewController.swift
//  btnGame
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //btn start
    @IBOutlet weak var ig_btnStart: UIButton!
    @IBOutlet weak var ig_retour: UIButton!
    
    @IBOutlet var ig_btnGame: [UIButton]!
    @IBOutlet var ig_btnUn: [UIButton]!
    @IBOutlet var ig_btnDeux: [UIButton]!
    @IBOutlet var ig_btnTrois: [UIButton]!
    @IBOutlet var ig_btnQuatre: [UIButton]!
    @IBOutlet var ig_btnCinq: [UIButton]!
    @IBOutlet var ig_btnSix: [UIButton]!
    @IBOutlet var ig_btnSept: [UIButton]!
    
    var timer:Timer?
    var test = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in ig_btnUn{
            i.alpha = 0
        }
        for i in ig_btnDeux{
            i.alpha = 0
        }
        for i in ig_btnTrois{
            i.alpha = 0
        }
        for i in ig_btnQuatre{
            i.alpha = 0
        }
        for i in ig_btnCinq{
            i.alpha = 0
        }
        for i in ig_btnSix{
            i.alpha = 0
        }
        for i in ig_btnSept{
            i.alpha = 0
        }
    }
    
    @IBAction func btn_Start(_ sender: UIButton) {
        ig_btnStart.alpha = 0
        ig_retour.alpha = 0
        let un =  ig_btnUn.randomElement()
        un?.tag = 1
        for i in ig_btnUn {
            i.alpha = 1
        }
        time()
    }
    
    @IBAction func btn_test(_ sender: UIButton) {
        timer?.invalidate()
        time()
        switch sender.tag {
        case 1:
            if test == 0{
                test = 1
                btn_un()
            }
            else{
                bad()
            }
        case 2 :
            if test == 1{
                test = 2
                btn_deux()
            }
            else{
                bad()
            }
        case 3 :
            if test == 2{
                test = 3
                btn_trois()
            }
            else{
                bad()
            }
        case 4 :
            if test == 3{
                test = 4
                btn_quatre()
            }
            else{
                bad()
            }
        case 5 :
            if test == 4{
                test = 5
                btn_cinq()
            }
            else{
                bad()
            }
        case 6 :
            if test == 5{
                test = 6
                btn_six()
            }
            else{
                bad()
            }
        case 7:
            if test == 6{
                btn_sept()
            }
            else{
                bad()
            }
        default:
            bad()
        }
    }
    
    func bad(){
        test = 0
        timer?.invalidate()
        for i in ig_btnGame {
            i.alpha = 0
            if i.tag != 0{
                i.tag = 0
            }
        }
        ig_btnStart.alpha = 1
        ig_retour.alpha = 1
    }
    
    @IBAction func btn_un() {
        let deux = ig_btnDeux.randomElement()
        deux?.tag = 2
        for i in ig_btnDeux {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_deux() {
        let trois = ig_btnTrois.randomElement()
        trois?.tag = 3
        for i in ig_btnTrois {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_trois() {
        let quatre = ig_btnQuatre.randomElement()
        quatre?.tag = 4
        for i in ig_btnQuatre {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_quatre() {
        let cinq = ig_btnCinq.randomElement()
        cinq?.tag = 5
        for i in ig_btnCinq {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_cinq() {
        
        let six = ig_btnSix.randomElement()
        six?.tag = 6
        for i in ig_btnSix {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_six() {
        let sept = ig_btnSept.randomElement()
        sept?.tag = 7
        for i in ig_btnSept {
            i.alpha = 1
        }
    }
    
    @IBAction func btn_sept() {
        for i in ig_btnGame {
            i.alpha = 0
            if i.tag != 0{
                i.tag = 0
            }
        }
        ig_btnStart.alpha = 1
        ig_retour.alpha = 1
    }
    private func time(){
        timer  = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { (_) in self.bad() })
    }
}
