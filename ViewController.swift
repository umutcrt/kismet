//
//  ViewController.swift
//  Kismet
//
//  Created by Umut Cörüt on 20.03.2022.
//

import UIKit
import GoogleMobileAds
import StoreKit

let slctArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
var answer = ""
var slctitem: [String] = []

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, GADFullScreenContentDelegate {
    
    
    private var interstitial: GADInterstitialAd?
    
    
    
    func numberTable() {
        if yellow1.text == "" {
            entry1.text = ""
            entry2.text = ""
            entry3.text = ""
            entry4.text = ""
        }
        else if yellow2.text == "" {
            entry5.text = ""
            entry6.text = ""
            entry7.text = ""
            entry8.text = ""
        }
        else if yellow3.text == "" {
            entry9.text = ""
            entry10.text = ""
            entry11.text = ""
            entry12.text = ""
        }
        else if yellow4.text == "" {
            entry13.text = ""
            entry14.text = ""
            entry15.text = ""
            entry16.text = ""
        }
        else if yellow5.text == "" {
            entry17.text = ""
            entry18.text = ""
            entry19.text = ""
            entry20.text = ""
        }
        else if yellow6.text == "" {
            entry21.text = ""
            entry22.text = ""
            entry23.text = ""
            entry24.text = ""
        }
        else if yellow7.text == "" {
            entry25.text = ""
            entry26.text = ""
            entry27.text = ""
            entry28.text = ""
        }
        else {}
    }
    
    func animateView2() {
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        self.winImage.frame = CGRect(x: width * 0.70, y: height * 0.70, width: width * 0.25, height: height * 0.15)
        self.baloonImage.frame = CGRect(x: width * 0.68, y: height * 0.68, width: width * 0.30, height: height * 0.18)
        self.loseImage.frame = CGRect(x: width * 0.68, y: height * 0.70, width: width * 0.30, height: height * 0.5)
        
        animater2()
        
        func animater2() {
            UIView.animate(withDuration: 1, animations: {
                self.winImage.frame = CGRect(x: width * 0.70, y: height * 0.695, width: width * 0.25, height: height * 0.15)
                self.baloonImage.frame = CGRect(x: width * 0.68, y: height * 0.675, width: width * 0.30, height: height * 0.18)
                self.loseImage.frame = CGRect(x: width * 0.69, y: height * 0.70, width: width * 0.30, height: height * 0.15)
                
                
            }, completion: { done in
                if done {
                    animaterRpt2()
                }
            })
        }
        
        func animaterRpt2() {
            UIView.animate(withDuration: 1, animations: {
                self.winImage.frame = CGRect(x: width * 0.70, y: height * 0.7, width: width * 0.25, height: height * 0.15)
                self.baloonImage.frame = CGRect(x: width * 0.68, y: height * 0.68, width: width * 0.30, height: height * 0.18)
                self.loseImage.frame = CGRect(x: width * 0.68, y: height * 0.70, width: width * 0.30, height: height * 0.15)
                
                
            }, completion: { done in
                if done {
                    animater2()
                }
            })
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    var core = 0
    func selectNumber() {
        for ar in slctArray {
            slctitem.append(ar)
        }
        if answer.count == 4 {
            answer = ""
        }
        for _ in 1...4 {
            random = slctitem.randomElement()!
            slctitem.remove(at: slctitem.firstIndex(of: random)!)
            answer += random
        }
    }
    
    @IBOutlet weak var greenColor: UILabel!
    @IBOutlet weak var blueColor: UILabel!
    @IBOutlet weak var gameArea: UIView!
    @IBOutlet weak var entry1: UILabel!
    @IBOutlet weak var entry2: UILabel!
    @IBOutlet weak var entry3: UILabel!
    @IBOutlet weak var entry4: UILabel!
    @IBOutlet weak var entry5: UILabel!
    @IBOutlet weak var entry6: UILabel!
    @IBOutlet weak var entry7: UILabel!
    @IBOutlet weak var entry8: UILabel!
    @IBOutlet weak var entry9: UILabel!
    @IBOutlet weak var entry10: UILabel!
    @IBOutlet weak var entry11: UILabel!
    @IBOutlet weak var entry12: UILabel!
    @IBOutlet weak var entry13: UILabel!
    @IBOutlet weak var entry14: UILabel!
    @IBOutlet weak var entry15: UILabel!
    @IBOutlet weak var entry16: UILabel!
    @IBOutlet weak var entry17: UILabel!
    @IBOutlet weak var entry18: UILabel!
    @IBOutlet weak var entry19: UILabel!
    @IBOutlet weak var entry20: UILabel!
    @IBOutlet weak var entry21: UILabel!
    @IBOutlet weak var entry22: UILabel!
    @IBOutlet weak var entry23: UILabel!
    @IBOutlet weak var entry24: UILabel!
    @IBOutlet weak var entry25: UILabel!
    @IBOutlet weak var entry26: UILabel!
    @IBOutlet weak var entry27: UILabel!
    @IBOutlet weak var entry28: UILabel!
    @IBOutlet weak var yellow1: UILabel!
    @IBOutlet weak var yellow2: UILabel!
    @IBOutlet weak var yellow3: UILabel!
    @IBOutlet weak var yellow4: UILabel!
    @IBOutlet weak var yellow5: UILabel!
    @IBOutlet weak var yellow6: UILabel!
    @IBOutlet weak var yellow7: UILabel!
    @IBOutlet weak var green1: UILabel!
    @IBOutlet weak var green2: UILabel!
    @IBOutlet weak var green3: UILabel!
    @IBOutlet weak var green4: UILabel!
    @IBOutlet weak var green5: UILabel!
    @IBOutlet weak var green6: UILabel!
    @IBOutlet weak var green7: UILabel!
    
    
    
    
    
    
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var loseImage: UIImageView!
    @IBOutlet weak var baloonImage: UIImageView!
    @IBOutlet weak var winImage: UIImageView!
    @IBOutlet weak var backgroundGame: UIImageView!
    @IBOutlet weak var faceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var matchUp: UILabel!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    func design(label: UILabel, corner: CGFloat, border: CGFloat) {
        
        label.layer.cornerRadius = corner
        label.layer.masksToBounds = true
        label.layer.borderWidth = border
        label.layer.borderColor = UIColor.black.cgColor
    }
    @IBOutlet weak var nextLabel: UIButton!
    @IBOutlet weak var clearLabel: UIButton!
    @IBOutlet weak var guessLabel: UIButton!
    
    @objc fileprivate func willEnterForeground() {
        // refresh the label here
        animateView2()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        animateView2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if removeAd == false {
            
      let request = GADRequest()
            GADInterstitialAd.load(withAdUnitID:"ca-app-pub-4842642976376796/3499315552",
                                   request: request,
                                   completionHandler: { [self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                interstitial = ad
                interstitial?.fullScreenContentDelegate = self
            }
            )
        }
        
        answerLabel.isHidden = true
        blueColor.isHidden = true
        greenColor.isHidden = true
        loseImage.isHidden = true
        baloonImage.isHidden = true
        winImage.isHidden = true
        nextLabel.isHidden = true
        matchUp.isHidden = true
        tryAgain.isHidden = true
        CollectionView.isHidden = false
        faceLabel.isHidden = true
        let width = view.frame.size.width
        let height = view.frame.size.height
        faceLabel.frame = CGRect(x: width * 0.48, y: height * 0.21, width: width * 0.50, height: height * 0.07)
        scoreLabel.frame = CGRect(x: width * 0.05, y: height * 0.13, width: width * 0.45, height: height * 0.05)
        CollectionView.frame = CGRect(x: width * 0.05, y: height * 0.68, width: width * 0.9, height: height * 0.19)
        nextLabel.frame = CGRect(x: width * 0.15, y: height * 0.89, width: width * 0.70, height: height * 0.07)
        clearLabel.frame = CGRect(x: width * 0.10, y: height * 0.89, width: width * 0.35, height: height * 0.07)
        guessLabel.frame = CGRect(x: width * 0.55, y: height * 0.89, width: width * 0.35, height: height * 0.07)
        equationLabel.frame = CGRect(x: width * 0.50, y: height * 0.04, width: width * 0.46, height: height * 0.08)
        matchUp.frame = CGRect(x: width * 0.05, y: height * 0.7, width: width * 0.7, height: height * 0.14)
        tryAgain.frame = CGRect(x: width * 0.15, y: height * 0.75, width: width * 0.7, height: height * 0.14)
        backgroundGame.frame = CGRect(x: width * 0, y: height * 0, width: width * 1, height: height * 1)
        gameArea.frame = CGRect(x: width * 0, y: height * 0.19, width: width * 1, height: height * 0.36)
        answerLabel.frame = CGRect(x: width * 0.5, y: height * 0.13, width: width * 0.37, height: height * 0.05)
        design(label: answerLabel, corner: 12, border: 1)

        
        yellow1.frame = CGRect(x: width * 0.13, y: height * 0, width: width * 0.1, height: height * 0.06)
        design(label: yellow1, corner: 8, border: 1)
        entry1.frame = CGRect(x: width * 0.254, y: height * 0, width: width * 0.12, height: height * 0.06)
        design(label: entry1, corner: 8, border: 1)
        entry2.frame = CGRect(x: width * 0.378, y: height * 0, width: width * 0.12, height: height * 0.06)
        design(label: entry2, corner: 8, border: 1)
        entry3.frame = CGRect(x: width * 0.502, y: height * 0, width: width * 0.12, height: height * 0.06)
        design(label: entry3, corner: 8, border: 1)
        entry4.frame = CGRect(x: width * 0.626, y: height * 0, width: width * 0.12, height: height * 0.06)
        design(label: entry4, corner: 8, border: 1)
        green1.frame = CGRect(x: width * 0.77, y: height * 0, width: width * 0.1, height: height * 0.06)
        design(label: green1, corner: 8, border: 1)
        yellow2.frame = CGRect(x: width * 0.13, y: height * 0.07, width: width * 0.10, height: height * 0.06)
        design(label: yellow2, corner: 8, border: 1)
        entry5.frame = CGRect(x: width * 0.254, y: height * 0.07, width: width * 0.12, height: height * 0.06)
        design(label: entry5, corner: 8, border: 1)
        entry6.frame = CGRect(x: width * 0.378, y: height * 0.07, width: width * 0.12, height: height * 0.06)
        design(label: entry6, corner: 8, border: 1)
        entry7.frame = CGRect(x: width * 0.502, y: height * 0.07, width: width * 0.12, height: height * 0.06)
        design(label: entry7, corner: 8, border: 1)
        entry8.frame = CGRect(x: width * 0.626, y: height * 0.07, width: width * 0.12, height: height * 0.06)
        design(label: entry8, corner: 8, border: 1)
        green2.frame = CGRect(x: width * 0.77, y: height * 0.07, width: width * 0.1, height: height * 0.06)
        design(label: green2, corner: 8, border: 1)
        yellow3.frame = CGRect(x: width * 0.13, y: height * 0.14, width: width * 0.10, height: height * 0.06)
        design(label: yellow3, corner: 8, border: 1)
        entry9.frame = CGRect(x: width * 0.254, y: height * 0.14, width: width * 0.12, height: height * 0.06)
        design(label: entry9, corner: 8, border: 1)
        entry10.frame = CGRect(x: width * 0.378, y: height * 0.14, width: width * 0.12, height: height * 0.06)
        design(label: entry10, corner: 8, border: 1)
        entry11.frame = CGRect(x: width * 0.502, y: height * 0.14, width: width * 0.12, height: height * 0.06)
        design(label: entry11, corner: 8, border: 1)
        entry12.frame = CGRect(x: width * 0.626, y: height * 0.14, width: width * 0.12, height: height * 0.06)
        design(label: entry12, corner: 8, border: 1)
        green3.frame = CGRect(x: width * 0.77, y: height * 0.14, width: width * 0.1, height: height * 0.06)
        design(label: green3, corner: 8, border: 1)
        yellow4.frame = CGRect(x: width * 0.13, y: height * 0.21, width: width * 0.10, height: height * 0.06)
        design(label: yellow4, corner: 8, border: 1)
        entry13.frame = CGRect(x: width * 0.254, y: height * 0.21, width: width * 0.12, height: height * 0.06)
        design(label: entry13, corner: 8, border: 1)
        entry14.frame = CGRect(x: width * 0.378, y: height * 0.21, width: width * 0.12, height: height * 0.06)
        design(label: entry14, corner: 8, border: 1)
        entry15.frame = CGRect(x: width * 0.502, y: height * 0.21, width: width * 0.12, height: height * 0.06)
        design(label: entry15, corner: 8, border: 1)
        entry16.frame = CGRect(x: width * 0.626, y: height * 0.21, width: width * 0.12, height: height * 0.06)
        design(label: entry16, corner: 8, border: 1)
        green4.frame = CGRect(x: width * 0.77, y: height * 0.21, width: width * 0.1, height: height * 0.06)
        design(label: green4, corner: 8, border: 1)
        yellow5.frame = CGRect(x: width * 0.13, y: height * 0.28, width: width * 0.10, height: height * 0.06)
        design(label: yellow5, corner: 8, border: 1)
        entry17.frame = CGRect(x: width * 0.254, y: height * 0.28, width: width * 0.12, height: height * 0.06)
        design(label: entry17, corner: 8, border: 1)
        entry18.frame = CGRect(x: width * 0.378, y: height * 0.28, width: width * 0.12, height: height * 0.06)
        design(label: entry18, corner: 8, border: 1)
        entry19.frame = CGRect(x: width * 0.502, y: height * 0.28, width: width * 0.12, height: height * 0.06)
        design(label: entry19, corner: 8, border: 1)
        entry20.frame = CGRect(x: width * 0.626, y: height * 0.28, width: width * 0.12, height: height * 0.06)
        design(label: entry20, corner: 8, border: 1)
        green5.frame = CGRect(x: width * 0.77, y: height * 0.28, width: width * 0.1, height: height * 0.06)
        design(label: green5, corner: 8, border: 1)
        yellow6.frame = CGRect(x: width * 0.13, y: height * 0.35, width: width * 0.10, height: height * 0.06)
        design(label: yellow6, corner: 8, border: 1)
        entry21.frame = CGRect(x: width * 0.254, y: height * 0.35, width: width * 0.12, height: height * 0.06)
        design(label: entry21, corner: 8, border: 1)
        entry22.frame = CGRect(x: width * 0.378, y: height * 0.35, width: width * 0.12, height: height * 0.06)
        design(label: entry22, corner: 8, border: 1)
        entry23.frame = CGRect(x: width * 0.502, y: height * 0.35, width: width * 0.12, height: height * 0.06)
        design(label: entry23, corner: 8, border: 1)
        entry24.frame = CGRect(x: width * 0.626, y: height * 0.35, width: width * 0.12, height: height * 0.06)
        design(label: entry24, corner: 8, border: 1)
        green6.frame = CGRect(x: width * 0.77, y: height * 0.35, width: width * 0.1, height: height * 0.06)
        design(label: green6, corner: 8, border: 1)
        yellow7.frame = CGRect(x: width * 0.13, y: height * 0.42, width: width * 0.10, height: height * 0.06)
        design(label: yellow7, corner: 8, border: 1)
        entry25.frame = CGRect(x: width * 0.254, y: height * 0.42, width: width * 0.12, height: height * 0.06)
        design(label: entry25, corner: 8, border: 1)
        entry26.frame = CGRect(x: width * 0.378, y: height * 0.42, width: width * 0.12, height: height * 0.06)
        design(label: entry26, corner: 8, border: 1)
        entry27.frame = CGRect(x: width * 0.502, y: height * 0.42, width: width * 0.12, height: height * 0.06)
        design(label: entry27, corner: 8, border: 1)
        entry28.frame = CGRect(x: width * 0.626, y: height * 0.42, width: width * 0.12, height: height * 0.06)
        design(label: entry28, corner: 8, border: 1)
        green7.frame = CGRect(x: width * 0.77, y: height * 0.42, width: width * 0.1, height: height * 0.06)
        design(label: green7, corner: 8, border: 1)
        
        CollectionView.backgroundColor = .clear
        
        
        if UserDefaults.standard.value(forKey: "facelabel") as? String ?? "try again..." == "try again..."{
            slctitem.removeAll()
            selectNumber()
        } else {
            if UserDefaults.standard.value(forKey: "facelabel") as? String ?? "great" == "great" || UserDefaults.standard.value(forKey: "facelabel") as? String ?? "amazing!" == "amazing!" {
                scoreCount = UserDefaults.standard.value(forKey: "scorecount") as? Int ?? 0
                slctitem.removeAll()
                selectNumber()
                UserDefaults.standard.setValue(answer, forKey: "answer")
                UserDefaults.standard.setValue("", forKey: "yellow")
                UserDefaults.standard.setValue("", forKey: "green")
                UserDefaults.standard.setValue("", forKey: "center")
                UserDefaults.standard.setValue(0, forKey: "trycount")
            } else {
                scoreCount = UserDefaults.standard.value(forKey: "scorecount") as? Int ?? 0
                
                    yellow1.text! = UserDefaults.standard.value(forKey: "yellow1") as? String ?? ""
                    entry1.text! = UserDefaults.standard.value(forKey: "entry1") as? String ?? ""
                    entry2.text! = UserDefaults.standard.value(forKey: "entry2") as? String ?? ""
                    entry3.text! = UserDefaults.standard.value(forKey: "entry3") as? String ?? ""
                    entry4.text! = UserDefaults.standard.value(forKey: "entry4") as? String ?? ""
                    green1.text! = UserDefaults.standard.value(forKey: "green1") as? String ?? ""
                    yellow2.text! = UserDefaults.standard.value(forKey: "yellow2") as? String ?? ""
                    entry5.text! = UserDefaults.standard.value(forKey: "entry5") as? String ?? ""
                    entry6.text! = UserDefaults.standard.value(forKey: "entry6") as? String ?? ""
                    entry7.text! = UserDefaults.standard.value(forKey: "entry7") as? String ?? ""
                    entry8.text! = UserDefaults.standard.value(forKey: "entry8") as? String ?? ""
                    green2.text! = UserDefaults.standard.value(forKey: "green2") as? String ?? ""
                    yellow3.text! = UserDefaults.standard.value(forKey: "yellow3") as? String ?? ""
                    entry9.text! = UserDefaults.standard.value(forKey: "entry9") as? String ?? ""
                    entry10.text! = UserDefaults.standard.value(forKey: "entry10") as? String ?? ""
                    entry11.text! = UserDefaults.standard.value(forKey: "entry11") as? String ?? ""
                    entry12.text! = UserDefaults.standard.value(forKey: "entry12") as? String ?? ""
                    green3.text! = UserDefaults.standard.value(forKey: "green3") as? String ?? ""
                    yellow4.text! = UserDefaults.standard.value(forKey: "yellow4") as? String ?? ""
                    entry13.text! = UserDefaults.standard.value(forKey: "entry13") as? String ?? ""
                    entry14.text! = UserDefaults.standard.value(forKey: "entry14") as? String ?? ""
                    entry15.text! = UserDefaults.standard.value(forKey: "entry15") as? String ?? ""
                    entry16.text! = UserDefaults.standard.value(forKey: "entry16") as? String ?? ""
                    green4.text! = UserDefaults.standard.value(forKey: "green4") as? String ?? ""
                    yellow5.text! = UserDefaults.standard.value(forKey: "yellow5") as? String ?? ""
                    entry17.text! = UserDefaults.standard.value(forKey: "entry17") as? String ?? ""
                    entry18.text! = UserDefaults.standard.value(forKey: "entry18") as? String ?? ""
                    entry19.text! = UserDefaults.standard.value(forKey: "entry19") as? String ?? ""
                    entry20.text! = UserDefaults.standard.value(forKey: "entry20") as? String ?? ""
                    green5.text! = UserDefaults.standard.value(forKey: "green5") as? String ?? ""
                    yellow6.text! = UserDefaults.standard.value(forKey: "yellow6") as? String ?? ""
                    entry21.text! = UserDefaults.standard.value(forKey: "entry21") as? String ?? ""
                    entry22.text! = UserDefaults.standard.value(forKey: "entry22") as? String ?? ""
                    entry23.text! = UserDefaults.standard.value(forKey: "entry23") as? String ?? ""
                    entry24.text! = UserDefaults.standard.value(forKey: "entry24") as? String ?? ""
                    green6.text! = UserDefaults.standard.value(forKey: "green6") as? String ?? ""
                    yellow7.text! = UserDefaults.standard.value(forKey: "yellow7") as? String ?? ""
                    entry25.text! = UserDefaults.standard.value(forKey: "entry25") as? String ?? ""
                    entry26.text! = UserDefaults.standard.value(forKey: "entry26") as? String ?? ""
                    entry27.text! = UserDefaults.standard.value(forKey: "entry27") as? String ?? ""
                    entry28.text! = UserDefaults.standard.value(forKey: "entry28") as? String ?? ""
                    green7.text! = UserDefaults.standard.value(forKey: "green7") as? String ?? ""
                tryCount = UserDefaults.standard.value(forKey: "trycount") as? Int ?? 0
                answer = UserDefaults.standard.value(forKey: "answer") as? String ?? ""
            }
        }
        self.navigationController?.navigationBar.tintColor = .white
        
        CollectionView.setCollectionViewLayout(generateLayout(), animated: false)
        CollectionView.dataSource = self
        CollectionView.delegate = self
        scoreLabel.text! = "Score: \(scoreCount)"
        print(answer)
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        if removeAd == false {
            let request = GADRequest()
                GADInterstitialAd.load(withAdUnitID:"ca-app-pub-4842642976376796/3499315552",
                                       request: request,
                                       completionHandler: { [self] ad, error in
                    if let error = error {
                        print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                        return
                    }
                    interstitial = ad
                    interstitial?.fullScreenContentDelegate = self
                }
                )
        }

       
        
        
    }
    
    @IBAction func skipButton(_ sender: Any) {
        if removeAd == false {

        if interstitial != nil {
                interstitial!.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
        }
        
        answerLabel.isHidden = true
        entry1.backgroundColor = blueColor.backgroundColor
        entry2.backgroundColor = blueColor.backgroundColor
        entry3.backgroundColor = blueColor.backgroundColor
        entry4.backgroundColor = blueColor.backgroundColor
        entry5.backgroundColor = blueColor.backgroundColor
        entry6.backgroundColor = blueColor.backgroundColor
        entry7.backgroundColor = blueColor.backgroundColor
        entry8.backgroundColor = blueColor.backgroundColor
        entry9.backgroundColor = blueColor.backgroundColor
        entry10.backgroundColor = blueColor.backgroundColor
        entry11.backgroundColor = blueColor.backgroundColor
        entry12.backgroundColor = blueColor.backgroundColor
        entry13.backgroundColor = blueColor.backgroundColor
        entry14.backgroundColor = blueColor.backgroundColor
        entry15.backgroundColor = blueColor.backgroundColor
        entry16.backgroundColor = blueColor.backgroundColor
        entry17.backgroundColor = blueColor.backgroundColor
        entry18.backgroundColor = blueColor.backgroundColor
        entry19.backgroundColor = blueColor.backgroundColor
        entry20.backgroundColor = blueColor.backgroundColor
        entry21.backgroundColor = blueColor.backgroundColor
        entry22.backgroundColor = blueColor.backgroundColor
        entry23.backgroundColor = blueColor.backgroundColor
        entry24.backgroundColor = blueColor.backgroundColor
        entry25.backgroundColor = blueColor.backgroundColor
        entry26.backgroundColor = blueColor.backgroundColor
        entry27.backgroundColor = blueColor.backgroundColor
        entry28.backgroundColor = blueColor.backgroundColor
        yellow1.text = ""
        entry1.text = ""
        entry2.text = ""
        entry3.text = ""
        entry4.text = ""
        green1.text = ""
        yellow2.text = ""
        entry5.text = ""
        entry6.text = ""
        entry7.text = ""
        entry8.text = ""
        green2.text = ""
        yellow3.text = ""
        entry9.text = ""
        entry10.text = ""
        entry11.text = ""
        entry12.text = ""
        green3.text = ""
        yellow4.text = ""
        entry13.text = ""
        entry14.text = ""
        entry15.text = ""
        entry16.text = ""
        green4.text = ""
        yellow5.text = ""
        entry17.text = ""
        entry18.text = ""
        entry19.text = ""
        entry20.text = ""
        green5.text = ""
        yellow6.text = ""
        entry21.text = ""
        entry22.text = ""
        entry23.text = ""
        entry24.text = ""
        green6.text = ""
        yellow7.text = ""
        entry25.text = ""
        entry26.text = ""
        entry27.text = ""
        entry28.text = ""
        green7.text = ""
        loseImage.isHidden = true
        baloonImage.isHidden = true
        winImage.isHidden = true
        faceLabel.textColor = .white
        faceLabel.text = "?"
        matchUp.isHidden = true
        tryAgain.isHidden = true
        CollectionView.isHidden = false
        slctitem.removeAll()
        answer = ""
        selectLetter = ""
        pointCount = 0
        difResult = 0
        difCount = 0
        tryCount = 0
        scoreLabel.text! = "Score: \(scoreCount)"
        CollectionView.setCollectionViewLayout(generateLayout(), animated: false)
        CollectionView.reloadData()
        selectNumber()
        nextLabel.isHidden = true
        clearLabel.isHidden = false
        guessLabel.isHidden = false
        print(answer)
    }
    var pointCount = 0
    var difCount = 0
    var difResult = 0
    var random = ""
    var tryCount = 0
    var scoreCount = 0
    var highScore = 0
    @IBAction func randomButton(_ sender: Any) {
        if selectLetter.count < 4 {}
        else if tryCount > 6 {}
        else {
            tryCount += 1
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
            for slc in answer {
                if selectLetter.contains(slc) == true {
                    difCount += 1
                }
            }
            difResult = difCount - pointCount
            if yellow1.text == "" {
                yellow1.text = "\(difResult)"
                green1.text = "\(pointCount)"
            }
            else if yellow2.text == "" {
                yellow2.text = "\(difResult)"
                green2.text = "\(pointCount)"
            }
            else if yellow3.text == "" {
                yellow3.text = "\(difResult)"
                green3.text = "\(pointCount)"
            }
            else if yellow4.text == "" {
                yellow4.text = "\(difResult)"
                green4.text = "\(pointCount)"
            }
            else if yellow5.text == "" {
                yellow5.text = "\(difResult)"
                green5.text = "\(pointCount)"
            }
            else if yellow6.text == "" {
                yellow6.text = "\(difResult)"
                green6.text = "\(pointCount)"
            }
            else if yellow7.text == "" {
                yellow7.text = "\(difResult)"
                green7.text = "\(pointCount)"
            }
            else {}
            
            if answer == selectLetter {
                
                if green1.text == "4" {
                    entry1.backgroundColor = greenColor.backgroundColor
                    entry2.backgroundColor = greenColor.backgroundColor
                    entry3.backgroundColor = greenColor.backgroundColor
                    entry4.backgroundColor = greenColor.backgroundColor
                }
                else if green2.text == "4" {
                    entry5.backgroundColor = greenColor.backgroundColor
                    entry6.backgroundColor = greenColor.backgroundColor
                    entry7.backgroundColor = greenColor.backgroundColor
                    entry8.backgroundColor = greenColor.backgroundColor
                }
                else if green3.text == "4" {
                    entry9.backgroundColor = greenColor.backgroundColor
                    entry10.backgroundColor = greenColor.backgroundColor
                    entry11.backgroundColor = greenColor.backgroundColor
                    entry12.backgroundColor = greenColor.backgroundColor
                }
                else if green4.text == "4" {
                    entry13.backgroundColor = greenColor.backgroundColor
                    entry14.backgroundColor = greenColor.backgroundColor
                    entry15.backgroundColor = greenColor.backgroundColor
                    entry16.backgroundColor = greenColor.backgroundColor
                }
                else if green5.text == "4" {
                    entry17.backgroundColor = greenColor.backgroundColor
                    entry18.backgroundColor = greenColor.backgroundColor
                    entry19.backgroundColor = greenColor.backgroundColor
                    entry20.backgroundColor = greenColor.backgroundColor
                }
                else if green6.text == "4" {
                    entry21.backgroundColor = greenColor.backgroundColor
                    entry22.backgroundColor = greenColor.backgroundColor
                    entry23.backgroundColor = greenColor.backgroundColor
                    entry24.backgroundColor = greenColor.backgroundColor
                }
                else if green7.text == "4" {
                    entry25.backgroundColor = greenColor.backgroundColor
                    entry26.backgroundColor = greenColor.backgroundColor
                    entry27.backgroundColor = greenColor.backgroundColor
                    entry28.backgroundColor = greenColor.backgroundColor
                }
                else {}

                scoreCount += 1
                loseImage.isHidden = true
                winImage.isHidden = false
                faceLabel.text = "great"
                matchUp.isHidden = false
                CollectionView.isHidden = true
                scoreLabel.text! = "Score: \(scoreCount)"
                clearLabel.isHidden = true
                guessLabel.isHidden = true
                nextLabel.isHidden = false
                core = UserDefaults.standard.value(forKey: "highscore")  as! Int
                if scoreCount > core {
                    winImage.isHidden = true
                    baloonImage.isHidden = false
                    faceLabel.text = "amazing!"
                    matchUp.isHidden = false
                    CollectionView.isHidden = true
                    core = scoreCount
                    UserDefaults.standard.setValue(core, forKey: "highscore")
                }
                UserDefaults.standard.setValue(faceLabel.text!, forKey: "facelabel")
                UserDefaults.standard.setValue(scoreCount, forKey: "scorecount")
                selectLetter = ""
            } else {
                if tryCount == 7 {
                    UserDefaults.standard.setValue("try again...", forKey: "facelabel")
                    faceLabel.text = "try again..."
                    loseImage.isHidden = false
                    tryAgain.isHidden = false
                    answerLabel.isHidden = false
                    answerLabel.text = "\(answer)"
                    CollectionView.isHidden = true
                    faceLabel.textColor = .systemYellow
                    UserDefaults.standard.setValue(faceLabel.text!, forKey: "facelabel")
                    scoreCount = 0
                    pointCount = 0
                    difCount = 0
                    selectLetter = ""
                    CollectionView.reloadData()
                    guessLabel.isHidden = true
                    clearLabel.isHidden = true
                    nextLabel.isHidden = false
                }
                else {
                    UserDefaults.standard.setValue("", forKey: "facelabel")
                    UserDefaults.standard.setValue(scoreCount, forKey: "scorecount")
                    
                    
                    
                    if yellow1.text != "" {
                        UserDefaults.standard.setValue(yellow1.text!, forKey: "yellow1")
                        UserDefaults.standard.setValue(entry1.text!, forKey: "entry1")
                        UserDefaults.standard.setValue(entry2.text!, forKey: "entry2")
                        UserDefaults.standard.setValue(entry3.text!, forKey: "entry3")
                        UserDefaults.standard.setValue(entry4.text!, forKey: "entry4")
                        UserDefaults.standard.setValue(green1.text!, forKey: "green1")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow1")
                        UserDefaults.standard.setValue("", forKey: "entry1")
                        UserDefaults.standard.setValue("", forKey: "entry2")
                        UserDefaults.standard.setValue("", forKey: "entry3")
                        UserDefaults.standard.setValue("", forKey: "entry4")
                        UserDefaults.standard.setValue("", forKey: "green1")
                    }
                    if yellow2.text != "" {
                        UserDefaults.standard.setValue(yellow2.text!, forKey: "yellow2")
                        UserDefaults.standard.setValue(entry5.text!, forKey: "entry5")
                        UserDefaults.standard.setValue(entry6.text!, forKey: "entry6")
                        UserDefaults.standard.setValue(entry7.text!, forKey: "entry7")
                        UserDefaults.standard.setValue(entry8.text!, forKey: "entry8")
                        UserDefaults.standard.setValue(green2.text!, forKey: "green2")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow2")
                        UserDefaults.standard.setValue("", forKey: "entry5")
                        UserDefaults.standard.setValue("", forKey: "entry6")
                        UserDefaults.standard.setValue("", forKey: "entry7")
                        UserDefaults.standard.setValue("", forKey: "entry8")
                        UserDefaults.standard.setValue("", forKey: "green2")
                    }
                    if yellow3.text != "" {
                        UserDefaults.standard.setValue(yellow3.text!, forKey: "yellow3")
                        UserDefaults.standard.setValue(entry9.text!, forKey: "entry9")
                        UserDefaults.standard.setValue(entry10.text!, forKey: "entry10")
                        UserDefaults.standard.setValue(entry11.text!, forKey: "entry11")
                        UserDefaults.standard.setValue(entry12.text!, forKey: "entry12")
                        UserDefaults.standard.setValue(green3.text!, forKey: "green3")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow3")
                        UserDefaults.standard.setValue("", forKey: "entry9")
                        UserDefaults.standard.setValue("", forKey: "entry10")
                        UserDefaults.standard.setValue("", forKey: "entry11")
                        UserDefaults.standard.setValue("", forKey: "entry12")
                        UserDefaults.standard.setValue("", forKey: "green3")
                    }
                    if yellow4.text != "" {
                        UserDefaults.standard.setValue(yellow4.text!, forKey: "yellow4")
                        UserDefaults.standard.setValue(entry13.text!, forKey: "entry13")
                        UserDefaults.standard.setValue(entry14.text!, forKey: "entry14")
                        UserDefaults.standard.setValue(entry15.text!, forKey: "entry15")
                        UserDefaults.standard.setValue(entry16.text!, forKey: "entry16")
                        UserDefaults.standard.setValue(green4.text!, forKey: "green4")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow4")
                        UserDefaults.standard.setValue("", forKey: "entry13")
                        UserDefaults.standard.setValue("", forKey: "entry14")
                        UserDefaults.standard.setValue("", forKey: "entry15")
                        UserDefaults.standard.setValue("", forKey: "entry16")
                        UserDefaults.standard.setValue("", forKey: "green4")
                    }
                    if yellow5.text != "" {
                        UserDefaults.standard.setValue(yellow5.text!, forKey: "yellow5")
                        UserDefaults.standard.setValue(entry17.text!, forKey: "entry17")
                        UserDefaults.standard.setValue(entry18.text!, forKey: "entry18")
                        UserDefaults.standard.setValue(entry19.text!, forKey: "entry19")
                        UserDefaults.standard.setValue(entry20.text!, forKey: "entry20")
                        UserDefaults.standard.setValue(green5.text!, forKey: "green5")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow5")
                        UserDefaults.standard.setValue("", forKey: "entry17")
                        UserDefaults.standard.setValue("", forKey: "entry18")
                        UserDefaults.standard.setValue("", forKey: "entry19")
                        UserDefaults.standard.setValue("", forKey: "entry20")
                        UserDefaults.standard.setValue("", forKey: "green5")
                    }
                    if yellow6.text != "" {
                        UserDefaults.standard.setValue(yellow6.text!, forKey: "yellow6")
                        UserDefaults.standard.setValue(entry21.text!, forKey: "entry21")
                        UserDefaults.standard.setValue(entry22.text!, forKey: "entry22")
                        UserDefaults.standard.setValue(entry23.text!, forKey: "entry23")
                        UserDefaults.standard.setValue(entry24.text!, forKey: "entry24")
                        UserDefaults.standard.setValue(green6.text!, forKey: "green6")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow6")
                        UserDefaults.standard.setValue("", forKey: "entry21")
                        UserDefaults.standard.setValue("", forKey: "entry22")
                        UserDefaults.standard.setValue("", forKey: "entry23")
                        UserDefaults.standard.setValue("", forKey: "entry24")
                        UserDefaults.standard.setValue("", forKey: "green6")
                    }
                    if yellow7.text != "" {
                        UserDefaults.standard.setValue(yellow7.text!, forKey: "yellow7")
                        UserDefaults.standard.setValue(entry25.text!, forKey: "entry25")
                        UserDefaults.standard.setValue(entry26.text!, forKey: "entry26")
                        UserDefaults.standard.setValue(entry27.text!, forKey: "entry27")
                        UserDefaults.standard.setValue(entry28.text!, forKey: "entry28")
                        UserDefaults.standard.setValue(green7.text!, forKey: "green7")
                    } else {
                        UserDefaults.standard.setValue("", forKey: "yellow7")
                        UserDefaults.standard.setValue("", forKey: "entry25")
                        UserDefaults.standard.setValue("", forKey: "entry26")
                        UserDefaults.standard.setValue("", forKey: "entry27")
                        UserDefaults.standard.setValue("", forKey: "entry28")
                        UserDefaults.standard.setValue("", forKey: "green7")
                    }
                    
                    UserDefaults.standard.setValue(tryCount, forKey: "trycount")
                    UserDefaults.standard.setValue(answer, forKey: "answer")
                    pointCount = 0
                    difCount = 0
                    selectLetter = ""
                    CollectionView.reloadData()
                }
            }
        }
    }
    @IBAction func ShuffleButton(_ sender: Any) {
        if faceLabel.text == "try again..." {}
        else if faceLabel.text == "amazing!"{}
        else if faceLabel.text == "great" {}
        else {
            numberTable()
            selectLetter = ""
            CollectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slctArray.count
    }
    private func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets (top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(65))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
        group.contentInsets = NSDirectionalEdgeInsets (top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    var selectLetter = ""
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItems = slctArray[indexPath.item]
        let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        if  selectedCell.layer.borderColor != UIColor.white.cgColor && selectLetter.count < 4 {
            if faceLabel.text == "amazing!"{}
            else if faceLabel.text == "try again..."{}
            else if faceLabel.text == "great" {}
            else if faceLabel.text == "really?" {}
            else if selectLetter.count < 4 {
                selectedCell.layer.borderWidth = 2
                selectedCell.layer.borderColor = UIColor.white.cgColor
                selectedCell.layer.backgroundColor = UIColor.systemCyan.cgColor
                
                if selectLetter.count < 4 && yellow1.text == "" {
                    if entry1.text == "" {
                        entry1.text = selectedItems
                    }
                    else if entry2.text == "" {
                        entry2.text = selectedItems
                    }
                    else if entry3.text == "" {
                        entry3.text = selectedItems
                    }
                    else if entry4.text == "" {
                        entry4.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow2.text == "" {
                    if entry5.text == "" {
                        entry5.text = selectedItems
                    }
                    else if entry6.text == "" {
                        entry6.text = selectedItems
                    }
                    else if entry7.text == "" {
                        entry7.text = selectedItems
                    }
                    else if entry8.text == "" {
                        entry8.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow3.text == "" {
                    if entry9.text == "" {
                        entry9.text = selectedItems
                    }
                    else if entry10.text == "" {
                        entry10.text = selectedItems
                    }
                    else if entry11.text == "" {
                        entry11.text = selectedItems
                    }
                    else if entry12.text == "" {
                        entry12.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow4.text == "" {
                    if entry13.text == "" {
                        entry13.text = selectedItems
                    }
                    else if entry14.text == "" {
                        entry14.text = selectedItems
                    }
                    else if entry15.text == "" {
                        entry15.text = selectedItems
                    }
                    else if entry16.text == "" {
                        entry16.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow5.text == "" {
                    if entry17.text == "" {
                        entry17.text = selectedItems
                    }
                    else if entry18.text == "" {
                        entry18.text = selectedItems
                    }
                    else if entry19.text == "" {
                        entry19.text = selectedItems
                    }
                    else if entry20.text == "" {
                        entry20.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow6.text == "" {
                    if entry21.text == "" {
                        entry21.text = selectedItems
                    }
                    else if entry22.text == "" {
                        entry22.text = selectedItems
                    }
                    else if entry23.text == "" {
                        entry23.text = selectedItems
                    }
                    else if entry24.text == "" {
                        entry24.text = selectedItems
                    }
                }
                else if selectLetter.count < 4 && yellow7.text == "" {
                    if entry25.text == "" {
                        entry25.text = selectedItems
                    }
                    else if entry26.text == "" {
                        entry26.text = selectedItems
                    }
                    else if entry27.text == "" {
                        entry27.text = selectedItems
                    }
                    else if entry28.text == "" {
                        entry28.text = selectedItems
                    }
                }
                else {}
                
                
                
                
                selectLetter += selectedItems
            }
        } else {}
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label?.text = slctArray[indexPath.item]
        cell.label?.textColor = .white
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.backgroundColor = UIColor(white: 1, alpha: 0.25)
        return cell
    }
    
}

