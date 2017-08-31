//
//  ViewController.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController
{
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var quoteArray = [Quote]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do
        {
            let realm = try Realm()
            self.quoteArray = realm.objects(Quote).toArray()
            
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
            }
        }
        catch _
        {}
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - ViewController Data Source
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return quoteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! QuoteTableViewCell
        cell.quoteLabel.text = quoteArray[indexPath.row].quoteText
        
        return cell
    }
}

//MARK: - ViewController Delegate
extension ViewController: UITableViewDelegate
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "toQuote", sender: self)
    }
}
extension Results {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}
