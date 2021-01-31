//
//  QuizViewController.swift
//  MyQuiz
//
//  Created by Apple on 31.01.2021.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var percent=0

    var quizModels = [Question]()
    
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource=self
        setupQuestions()
        configureUI(question: quizModels.first!)

    }
   
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion=question
        table.reloadData()
        
        
    }
    
    private func chekAnswer(answer: Answer, question: Question)->Bool{
        return question.answers.contains(where: { $0.text == answer.text}) && answer.correct
    }
    
    private func setupQuestions(){
        quizModels.append(Question(text: "What is my name", answers: [
            Answer(text: "Askar", correct: false),
            Answer(text: "Dimash", correct: true),
            Answer(text: "Madi", correct: false),
            Answer(text: "Kamen", correct: false)
        ]))
        quizModels.append(Question(text: "Who is the best teacher", answers: [
            Answer(text: "Alpamys", correct: false),
            Answer(text: "Alpamys agai", correct: false),
            Answer(text: "Mr. Alpamys", correct: false),
            Answer(text: "Of course Mr. Alpamys agai", correct: true)
        ]))
        quizModels.append(Question(text: "The capital of Madagascar", answers: [
            Answer(text: "Antananarivo", correct: true),
            Answer(text: " Antanananarivo", correct: false),
            Answer(text: " Antanarivo", correct: false),
            Answer(text: "I don't know:(", correct: false)
        ]))
        quizModels.append(Question(text: "5+5", answers: [
            Answer(text: "15", correct: false),
            Answer(text: "12", correct: false),
            Answer(text: "10", correct: true),
            Answer(text: "8", correct: false)
        ]))
        quizModels.append(Question(text: "The biggest country", answers: [
            Answer(text: "Kazakhstan", correct: false),
            Answer(text: "Russia", correct: true),
            Answer(text: "Moscow", correct: false),
            Answer(text: "USA", correct: false)
        ]))
        quizModels.append(Question(text: "How old am I", answers: [
            Answer(text: "21", correct: false),
            Answer(text: "20", correct: false),
            Answer(text: "19", correct: true),
            Answer(text: "18", correct: false)
        ]))
        quizModels.append(Question(text: "The biggest city in Kazakhstan", answers: [
            Answer(text: "Astana", correct: true),
            Answer(text: "Almaty", correct: false),
            Answer(text: "Shymkent", correct: false),
            Answer(text: "Aktau", correct: false)
        ]))
        quizModels.append(Question(text: "The best university in the world", answers: [
            Answer(text: "MIT", correct: false),
            Answer(text: "AITU", correct: true),
            Answer(text: "Oxford", correct: false),
            Answer(text: "Cambridge", correct: false)
        ]))
        quizModels.append(Question(text: "2+2*2", answers: [
            Answer(text: "8", correct: false),
            Answer(text: "10", correct: false),
            Answer(text: "6", correct: true),
            Answer(text: "4", correct: false)
        ]))
        quizModels.append(Question(text: "The best FC in the world", answers: [
            Answer(text: "Barcelona", correct: false),
            Answer(text: "Real Madrid", correct: true),
            Answer(text: "MU", correct: false),
            Answer(text: "MC", correct: false)
        ]))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if chekAnswer(answer: answer, question: question){
            if let index = quizModels.firstIndex(where: {$0.text == question.text}){
                if index < (quizModels.count-1){
                    let nextQuestion = quizModels[index+1]
                    print("\(nextQuestion.text)")
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                    
                }
                
            }
            percent = percent + 10
        }
        else{
            if let index = quizModels.firstIndex(where: {$0.text == question.text}){
                if index < (quizModels.count-1){
                    let nextQuestion = quizModels[index+1]
                    print("\(nextQuestion.text)")
                    configureUI(question: nextQuestion)
                    table.reloadData()
                }
                
            }
        }
    }
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
