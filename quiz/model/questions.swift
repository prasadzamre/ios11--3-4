//
//  questions.swift
//  quiz
//
//  Created by Prasad Zamre on 15/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import Foundation


class Question{
    
    let questionText : String
    let answer : Bool
    init(text:String, correctAnswer:Bool)
    {
        questionText = text
        answer = correctAnswer
    }
    
}

