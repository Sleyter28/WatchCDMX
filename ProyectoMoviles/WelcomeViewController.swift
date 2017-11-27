//
//  WelcomeViewController.swift
//  ProyectoMoviles
//
//  Created by Sleyter Angulo on 9/13/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

      @IBOutlet weak var progressView: UIProgressView!
      
      
      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            let  timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){(timer: Timer) in self.progressView.setProgress(self.progressView.progress + 0.5, animated: true)
                  if self.progressView.progress >= 1 {
                        //timer.invalidate()
                        let home = self.storyboard?.instantiateViewController(withIdentifier: "Home") //Asi es como se llama a otro controlador se declara la variable
                        self.present(home!, animated:true, completion: nil)//Aqui es donde realmente se llama
                  }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
