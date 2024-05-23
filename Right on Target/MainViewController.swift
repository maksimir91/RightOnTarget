//
//  MainViewController.swift
//  Right on Target
//
//  Created by Stanislav Shut on 22.05.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }


  
    // MARK: - Navigation
    @IBAction func previousScreen( unwindSegue: UIStoryboardSegue ) {
        return
    }
}
