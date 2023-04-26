//
//  Question.swift
//  YoungStarsApp
//
//  Created by Seattle on 2023/4/26.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static var allQuestions = [
        Question(questionText:"下面夏林希的扮演者是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 2),
        Question(questionText:"下面LV的代言人是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 1),
        Question(questionText:"下面参与流浪星球电影的扮演者是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 3),
        Question(questionText:"下面年龄最小的演员是哪位00后小花？",
                possibleAnswers: ["胡连馨","艾米","向涵之","赵今麦"],
                correctAnswerIndex: 1),
        Question(questionText:"下面98年出生的演员是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 1),
        Question(questionText:"下面00年出生的演员是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 0),
        Question(questionText:"下面02年出生的演员是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 3),
        Question(questionText:"下面95年出生的演员是哪位00后小花？",
                possibleAnswers: ["胡连馨","周也","王楚然","赵今麦"],
                correctAnswerIndex: 2),
        Question(questionText:"下面最火的的演员是哪位00后小花？",
                possibleAnswers: ["赵露思","周也","向涵之","赵今麦"],
                correctAnswerIndex: 0),
        Question(questionText:"你最喜欢？",
                possibleAnswers: ["胡连馨","周也","向涵之","赵今麦"],
                correctAnswerIndex: 2),
    ]
}
