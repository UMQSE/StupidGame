//
//  ViewPoint.swift
//  btnGame
//
//  Created by Admin on 03/06/2019.
//  Copyright © 2019 Moi. All rights reserved.
//

import UIKit

class ViewPoint: UIViewController {

    @IBOutlet weak var ig_labelScore: UILabel!
   
    var timer:Timer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ig_labelScore.text = "vous avez \(UserData().point())"
        time()
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    private func time(){
        timer  = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { (_) in self.addPoint() })
    }
    private func addPoint(){
        UserData().setPoint(point: UserData().point()+1)
        ig_labelScore.text = "vous avez \(UserData().point())"
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
