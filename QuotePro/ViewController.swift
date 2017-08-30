//
//  ViewController.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: ViewController Data Source
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

//MARK: ViewController Delegate
extension ViewController: UITableViewDelegate
{
//    func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "toQuote"
//        {
//            if let quoteVC = segue.destination as?
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "toQuote", sender: self)
    }
}
