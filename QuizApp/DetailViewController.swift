//
//  DetailViewController.swift
//  QuizApp
//
//  Created by MacBook on 23.01.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    
    let questions = ["Fatih Sultan Mehmet’in babası kimdir?","Magna Carta hangi ülkenin kralıyla yapılmış bir sözleşmedir?","Hangi yabancı futbolcu Fenerbahçe forması giymiştir?","Simyacı kitabının yazarı kim?", "Gezegenler isimlerini nereden alıyor?", "Güneş sistemimizde kaç gezegen var?","Hangisi periyodik tabloda bulunan bir element değildir?","Hangisi bir doğal sayıdır?","Galatasaray hangi yıl UEFA kupasını almıştır?","Kıbrıs Barış harekatı hangi tarihte gerçekleşmiştir?","Hangi ülke Asya kıtasındadır?","ABD başkanlarından John Fitzgerald Kennedy’e suikast düzenleyerek öldüren kimdir?","Aşağıdaki hangi Anadolu takımı Türkiye Süper Liginde şampiyon olmuştur?","Hangisi bir hücrede bulunan organeldir?","Tarihçilerin Kutbu olarak bilinen dünyaca ünlü tarihçimiz kimdir?","Fransız İhtilali kaç yılında gerçekleşmiştir?","Türkiye Süper Liginde 4 yıldızı olan futbol takımı hangisidir?"]
    let answers = [["II.Murat", "I.Mehmet", "Yıldırım Beyazıt"],[ "İngiltere","İspanya", "Almanya"],[ "Schumacher","Simoviç", "Prekazi"],["Paulo Coelho", "Osho", "Lev Tolstoy"], ["Yunan Tanrılarından.", "Onları keşfeden bilim adamlarından.", "Latince kelimelerden."], ["8", "9", "10"],["Su", "Azot", "Oksijen"],["0", "-1", "2.5"],["2000", "2001", "2002"],["1974", "1972", "1970"],["Singapur", "Peru", "Madagaskar"],["Lee Harvey Oswald", "Clay Shaw", "Jack Ruby"],["Bursaspor", "Sivasspor", "Kocaelispor"],["Lizozom", "RNA", "DNA"],["Halil İnalcık", "Mehmet Fuat Köprülü", "İlber Ortaylı"],["1789-1799", "1768-1787", "1876-1889"],["Galatasaray", "Fenerbahçe", "Beşiktaş"]]
    
    
    var currentQuestion = 0
    var score = 0
    var rightAnswer : UInt32 = 0
    var defaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
    }

    @IBAction func onClickAnswer(_ sender: UIButton) {
        if sender.tag == Int(rightAnswer) {
            print("Right!")
            score += 1
        }else{
            print("Wrong!")
    
        }
        if currentQuestion != questions.count {
            nextQuestion()
        }else{
            defaults.set(String(score), forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func nextQuestion()  {
        
        lblQuestion.text = questions[currentQuestion]
        
        rightAnswer = arc4random_uniform(3) + 1
        
        var button = UIButton()
        
        var wrongAnswer = 1
        
        for i in 1...3 {
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer) {
                
                button.setTitle(answers[currentQuestion][0], for: .normal)
                
            }else {
                
                button.setTitle(answers[currentQuestion][wrongAnswer], for: .normal)
                
                wrongAnswer = 2
            }
            
        }
        currentQuestion += 1
    }
    
}
