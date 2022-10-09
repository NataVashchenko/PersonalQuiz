//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var winner: (animal: Animal, score: Int)?
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        var chart: [Animal: Int] = [:]
        
        for answer in answers {
            if let number = chart[answer.animal]  {
                chart[answer.animal] = 1 + number
            } else {
                chart[answer.animal] = 1
            }
        }
        
        
        
        for (animal, score) in chart {
            if let winner = winner {
                if winner.score < score {
                    self.winner = (animal, score)
                }
            } else {
                self.winner = (animal, score)
            }
        }
        guard let winner = self.winner else { return }
        headerLabel.text = "Вы - \(winner.animal.rawValue)"
        descriptionLabel.text = winner.animal.definition
    }


    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
