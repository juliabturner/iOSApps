//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Julia Turner on 2020-09-14.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText : String
    let answerText : String
    
    init(q: String, a: String) {
        questionText = q
        answerText = a
    }
}
