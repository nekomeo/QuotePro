//
//  Quote.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class Quote: NSObject
{
    var quoteText: String
    var quoteAuthor: String
    
    init(quoteText: String, quoteAuthor: String)
    {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
    }
    
//    http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json -> URL Link
//    http://forismatic.com/en/e6c591a800/ -> Quote Link
}
