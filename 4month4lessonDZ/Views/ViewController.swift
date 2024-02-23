//
//  ViewController.swift
//  4month4lessonDZ
//
//  Created by Apple on 22.2.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  
    }

}
