//
//  ViewPFCLS.swift
//  btnGame
//
//  Created by Admin on 03/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import UIKit

class ViewPFCLS: UIViewController {
    

    @IBOutlet weak var ig_btnStart: UIButton!
    @IBOutlet weak var ig_btnReset: UIButton!
    @IBOutlet weak var ig_labelResultat: UITextView!
    @IBOutlet var ig_choix: [UIButton]!
    @IBOutlet weak var ig_pierre: UIButton!
    @IBOutlet weak var ig_feuille: UIButton!
    @IBOutlet weak var ig_spok: UIButton!
    @IBOutlet weak var ig_lezard: UIButton!
    @IBOutlet weak var ig_ciseaux: UIButton!
    var rng:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in ig_choix{
            i.alpha = 0
        }
        ig_btnReset.alpha = 0
        ig_labelResultat.text = ""
    }
    
    @IBAction func btn_start(_ sender: Any) {
        rng = ig_choix.randomElement()!.tag
        for i in ig_choix{
            i.alpha = 1
        }
        ig_btnStart.alpha = 0
    }
    @IBAction func btn_test(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            pierre(choix:sender.tag)
        case 2:
            feuille(choix:sender.tag)
        case 3:
            ciseaux(choix:sender.tag)
        case 4:
            spok(choix:sender.tag)
        case 5:
            lezard(choix:sender.tag)
        default:
            loose(choix:sender.tag)
        }
        for i in ig_choix{
            i.alpha = 0
        }
        ig_btnReset.alpha = 1
    }
    private func toText(choix:Int)->String{
        switch choix {
        case 1:
            return "Pierre"
        case 2:
            return "Feuille"
        case 3:
            return "Ciseaux"
        case 4:
            return "Spock"
        case 5:
            return "lézard"

        default:
            return ""
        }
    }
    func loose(choix:Int){
        let player = toText(choix:choix)
        let ordi = toText(choix: rng)
        
        ig_labelResultat.text = "vous avez jouez \(player) et la RNG a choisit \(ordi) vous avez donc perdu!"
    }
    
    func win(choix:Int){
        let player = toText(choix:choix)
        let ordi = toText(choix: rng)
        
        ig_labelResultat.text = "vous avez jouez \(player) et la RNG a choisit \(ordi) vous avez donc gagné!"
    }
    
    func tie(choix:Int){
        let player = toText(choix:choix)
        let ordi = toText(choix: rng)
        
        ig_labelResultat.text = "vous avez jouez \(player) et la RNG a choisit \(ordi) il y a donc égalité!"
    }
    
    func pierre(choix:Int){
        switch rng {
        case 3,5:
            win(choix:choix)
        case 1:
            tie(choix:choix)
        case 2,4:
            loose(choix:choix)
        default:
            loose(choix:choix)
        }
    }
    func feuille(choix:Int){
        switch rng {
        case 1,4:
            win(choix:choix)
        case 2:
            tie(choix:choix)
        case 3,5:
            loose(choix:choix)
        default:
            loose(choix:choix)
        }
    }
    func ciseaux(choix:Int){
        switch rng {
        case 2,5:
            win(choix:choix)
        case 3:
            tie(choix:choix)
        case 1,4:
            loose(choix:choix)
        default:
            loose(choix:choix)
        }
    }
    func spok(choix:Int){
        switch rng {
        case 3,1:
            win(choix:choix)
        case 4:
            tie(choix:choix)
        case 2,5:
            loose(choix:choix)
        default:
            loose(choix:choix)
        }
    }
    @IBAction func btnReset(_ sender: Any) {
        for i in ig_choix{
            i.alpha = 0
        }
        ig_btnReset.alpha = 0
        ig_btnStart.alpha = 1
        ig_labelResultat.text = ""
    }
    func lezard(choix:Int){
        switch rng {
        case 4,2:
            win(choix:choix)
        case 5:
            tie(choix:choix)
        case 1,3:
            loose(choix:choix)
        default:
            loose(choix:choix)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
