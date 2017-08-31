//
//  QuoteView.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(quote: Quote)
    {
        self.quoteLabel.text = quote.quoteText
        self.authorLabel.text = quote.quoteAuthor
    }

}
