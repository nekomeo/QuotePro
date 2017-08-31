//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController
{
    
    
    @IBOutlet var thisView: UIView!
    @IBOutlet weak var randomQuoteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var randomImageButton: UIButton!
    
    var photos = [Photo]()
    var quote : Quote?
    var quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first! as! QuoteView
    var quoteArray = [Quote]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        
        self.thisView.addSubview(quoteView)
        //add constraints here
        quoteViewConstraints()
        
        
        grabQuote()
        grabImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - QuoteView Constraints
    func quoteViewConstraints()
    {
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.leadingAnchor.constraint(equalTo: self.thisView.leadingAnchor, constant: 0).isActive = true
        quoteView.trailingAnchor.constraint(equalTo: self.thisView.trailingAnchor, constant: 0).isActive = true
        quoteView.widthAnchor.constraint(equalToConstant: self.thisView.frame.size.width).isActive = true
        quoteView.heightAnchor.constraint(equalTo: self.thisView.heightAnchor, constant: -40).isActive = true
    }
    
    func grabQuote()
    {
        let newHandler = APIHandler()
        newHandler.APISetup(completion: { result in
//            print(result)
            let dictionary = result
            let newQuote = Quote(quoteText: dictionary.value(forKey: "quoteText") as! String, quoteAuthor: dictionary.value(forKey: "quoteAuthor") as! String)
            self.quoteArray.append(newQuote)
            
            DispatchQueue.main.async
            {
//                self.quote.reloadData()
//                quoteView.setupWithQuote(quote: quote)
                self.quoteView.setupWithQuote(quote: newQuote)
            }
            
        })
        
        newHandler.getImage(completion: { result in
//            let dictionary = result
            //            let newImage = Photo()
        })
    }
    
    func grabImage()
    {
        quoteView.image.imageFromUrl(urlString: "https://lorempixel.com/400/600/nature/")
    }

    @IBAction func randomQuote(_ sender: UIButton)
    {
        grabQuote()
    }
    
    @IBAction func save(_ sender: UIButton)
    {
        //
    }
    
    @IBAction func randomImage(_ sender: UIButton)
    {
        grabImage()
    }
    
}

extension UIImageView
{
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {
                (response: URLResponse?, data: Data?, error: Error?) -> Void in
                if let imageData = data as Data? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
