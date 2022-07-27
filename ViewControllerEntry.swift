//
//  ViewControllerEntry.swift
//  Kismet
//
//  Created by Umut Cörüt on 28.03.2022.
//

import UIKit
import GoogleMobileAds
import StoreKit

var removeAd = false
let productID = "com.UmutCorut.MatchUp.RemoveAds"

class ViewControllerEntry: UIViewController, GADFullScreenContentDelegate, SKPaymentTransactionObserver {
    
    
    private var interstitial: GADInterstitialAd?
    
    @IBOutlet weak var restoreLabel: UIButton!
    @IBOutlet weak var removeAdsLabel: UIButton!
    @IBOutlet weak var backgroundEntry: UIImageView!
    @IBOutlet weak var howLabel: UIButton!
    @IBOutlet weak var appyNumbers: UILabel!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var entryImage: UIImageView!
    
    func animateView() {
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        self.entryImage.frame = CGRect(x: width * 0.32, y: height * 0.313, width: width * 0.4, height: height * 0.18)
        
        animater()
        
        
        
        func animater() {
            UIView.animate(withDuration: 1, animations: {
                
                self.entryImage.frame = CGRect(x: width * 0.33, y: height * 0.32, width: width * 0.40, height: height * 0.18)
                
            }, completion: { done in
                if done {
                    animaterRpt()
                }
            })
        }
        
        func animaterRpt() {
            UIView.animate(withDuration: 1, animations: {
                self.entryImage.frame = CGRect(x: width * 0.32, y: height * 0.313, width: width * 0.4, height: height * 0.18)
                
            }, completion: { done in
                if done {
                    animater()
                }
            })
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc fileprivate func willEnterForeground() {
        // refresh the label here
        animateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lastScore.text! = "🎖\n\(UserDefaults.standard.value(forKey: "highscore") ?? 0)"
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        animateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeAd = false
        
        SKPaymentQueue.default().add(self)
        
        if isPurchased() {
            showPremium()
        }
        
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
        
        
        howLabel.titleLabel?.textAlignment = .center
        if UserDefaults.standard.value(forKey: "highscore") == nil {
            UserDefaults.standard.setValue(0, forKey: "highscore")
        }
        let width = view.frame.size.width
        let height = view.frame.size.height
        lastScore.frame = CGRect(x: width * 0.35, y: height * 0.80, width: width * 0.3, height: height * 0.16)
        appyNumbers.frame = CGRect(x: width * 0.1, y: height * 0.14, width: width * 0.80, height: height * 0.1)
        howLabel.frame = CGRect(x: width * 0.30, y: height * 0.3, width: width * 0.4, height: height * 0.26)
        play.frame = CGRect(x: width * 0.245, y: height * 0.68, width: width * 0.51, height: height * 0.08)
        backgroundEntry.frame = CGRect(x: width * 0, y: height * 0, width: width * 1, height: height * 1)
        removeAdsLabel.frame = CGRect(x: width * 0.7, y: height * 0.85, width: width * 0.25, height: height * 0.06)
        restoreLabel.frame = CGRect(x: width * 0.05, y: height * 0.85, width: width * 0.25, height: height * 0.06)
        removeAdsLabel.titleLabel?.textAlignment = .center
        restoreLabel.titleLabel?.textAlignment = .center
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
    @IBOutlet weak var lastScore: UILabel!
    
    
    @IBAction func play(_ sender: Any) {
        if removeAd == false {
            if interstitial != nil {
                interstitial!.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
        }
        
    }
    @IBAction func restoreButton(_ sender: Any) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    @IBAction func howButton(_ sender: Any) {
    }
    @IBAction func removeAds(_ sender: Any) {
        buyPremium()
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                //                User payment successful
                print("Transaction successful!")
                removeAdsLabel.isHidden = true
                restoreLabel.isHidden = true
                showPremium()
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .failed {
                //                Payment failed
                
                if let error = transaction.error {
                    let errorDescription = error.localizedDescription
                    print("Transaction failed dut to error: \(errorDescription)")
                }
                removeAdsLabel.isHidden = false
                restoreLabel.isHidden = false
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .restored {
                showPremium()
                print("Transaction restored")
                restoreLabel.isHidden = true
                removeAdsLabel.isHidden = true
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    func isPurchased() -> Bool {
        let purchasesStatus = UserDefaults.standard.bool(forKey: productID)
        
        if purchasesStatus {
            print("Previously purchased")
            return true
        } else {
            print("Never purchased")
            return false
        }
        
    }
    func showPremium() {
        
        UserDefaults.standard.set(true, forKey: productID)
        
        removeAd = true
        removeAdsLabel.isHidden = true
        restoreLabel.isHidden = true
    }
    func buyPremium() {
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            
        } else {
            print("User can't make payments")
        }
    }
}
