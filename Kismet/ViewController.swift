//
//  ViewController.swift
//  Kismet
//
//  Created by Umut Cörüt on 20.03.2022.
//

import UIKit



let slctArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
var answer = ""
var slctitem: [String] = []



class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var faceLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var trueLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text! = "SCORE \n 0"
        for ar in slctArray {
            slctitem.append(ar)
        }
        
        faceLabel.layer.cornerRadius = 12
        faceLabel.layer.masksToBounds = true
        faceLabel.layer.borderWidth = 4
        faceLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        scoreLabel.layer.cornerRadius = 35
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.borderWidth = 4
        scoreLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        trueLabel.layer.cornerRadius = 12
        trueLabel.layer.masksToBounds = true
        trueLabel.layer.borderWidth = 4
        trueLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        changeLabel.layer.cornerRadius = 12
        changeLabel.layer.masksToBounds = true
        changeLabel.layer.borderWidth = 4
        changeLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        tryLabel.layer.cornerRadius = 12
        tryLabel.layer.masksToBounds = true
        tryLabel.layer.borderWidth = 4
        tryLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        answerLabel.layer.cornerRadius = 12
        answerLabel.layer.masksToBounds = true
        answerLabel.layer.borderWidth = 4
        answerLabel.layer.borderColor = UIColor.systemBrown.cgColor
        
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        
        for i in 1...5 {
            random = slctitem.randomElement()!
            slctitem.remove(at: slctitem.index(of: random)!)
            answer += random
        }
        
        CollectionView.setCollectionViewLayout(generateLayout(), animated: false)
        
        print(answer)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        if faceLabel.text != "😍"{
            scoreLabel.text = "SCORE \n 0"
        } else {
            scoreLabel.text! = "SCORE \n \(scoreCount)"
        }
        faceLabel.text = "👀"
        slctitem.removeAll()
        for ar in slctArray {
            slctitem.append(ar)
        }
        
        
        answer = ""
        answerLabel.text = ""
        selectLetter = ""
        changeLabel.text = ""
        trueLabel.text = ""
        pointCount = 0
        difResult = 0
        difCount = 0
        tryLabel.text = ""
        tryCount = 0
        
        CollectionView.setCollectionViewLayout(generateLayout(), animated: false)
        
        CollectionView.reloadData()
        for i in 1...5 {
            random = slctitem.randomElement()!
            slctitem.remove(at: slctitem.index(of: random)!)
            answer += random }
        print(answer)
        
    }
    
    var pointCount = 0
    var difCount = 0
    var difResult = 0
    var random = ""
    var tryCount = 0
    var scoreCount = 0
    @IBAction func randomButton(_ sender: Any) {
        
        
        if selectLetter.count < 5 {}
        else if tryCount > 8 {
        }
        else {
            
            if answer[answer.index(answer.startIndex, offsetBy: 0)] == selectLetter[selectLetter.index(selectLetter.startIndex, offsetBy: 0)] {
                pointCount += 1
            }
            if answer[answer.index(answer.startIndex, offsetBy: 1)] == selectLetter[selectLetter.index(selectLetter.startIndex, offsetBy: 1)] {
                pointCount += 1
            }
            if answer[answer.index(answer.startIndex, offsetBy: 2)] == selectLetter[selectLetter.index(selectLetter.startIndex, offsetBy: 2)] {
                pointCount += 1
            }
            if answer[answer.index(answer.startIndex, offsetBy: 3)] == selectLetter[selectLetter.index(selectLetter.startIndex, offsetBy: 3)] {
                pointCount += 1
            }
            if answer[answer.index(answer.startIndex, offsetBy: 4)] == selectLetter[selectLetter.index(selectLetter.startIndex, offsetBy: 4)] {
                pointCount += 1
            }
            for slc in answer {
                if selectLetter.contains(slc) == true {
                    difCount += 1
                }
            }
            difResult = difCount - pointCount
            
            tryLabel.text! += "\n \(selectLetter)"
            trueLabel.text! += "\n \(pointCount)"
            changeLabel.text! += "\n \(difResult)"
            
            
            
            if answer == selectLetter {
                faceLabel.text = "😍"
                scoreCount += 1
                selectLetter = ""
                
                
            } else {
                tryCount += 1
                if tryCount == 9 {
                    
                    faceLabel.text = "😞"
                    answerLabel.text = "\(answer)"
                    scoreCount = 0
                    pointCount = 0
                    difCount = 0
                    selectLetter = ""
                    CollectionView.reloadData()
                }
                else {
                    pointCount = 0
                    difCount = 0
                    answerLabel.text = ""
                    selectLetter = ""
                    CollectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func ShuffleButton(_ sender: Any) {
        
        if faceLabel.text == "😞" {}
        else if faceLabel.text == "😍"{}
        else {
            answerLabel.text = ""
            selectLetter = ""
            CollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slctArray.count
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 2
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets (top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
        group.contentInsets = NSDirectionalEdgeInsets (top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
    
    var selectLetter = ""
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let selectedItems = slctArray[indexPath.item]
        let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        
        if  selectedCell.contentView.backgroundColor == .white && answerLabel.text!.count < 5 {
            if faceLabel.text == "😍"{}
            else if faceLabel.text == "😞"{}
            else if answerLabel.text!.count < 5 {
                selectedCell.contentView.backgroundColor = .systemBrown
                selectLetter += selectedItems
                answerLabel.text = selectLetter
                
            }
        } else {}
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.contentView.backgroundColor = .white
        cell.label?.text = slctArray[indexPath.item]
        cell.label?.textColor = .black
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 4
        cell.layer.borderColor = UIColor.systemBrown.cgColor
        return cell
        
    }
    
}

