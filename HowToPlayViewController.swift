//
//  HowToPlayViewController.swift
//  Kismet
//
//  Created by Umut Cörüt on 31.05.2022.
//

import UIKit

class HowToPlayViewController: UIViewController, UIScrollViewDelegate {
    
    func animateView3() {
        let width = view.frame.size.width
        let height = view.frame.size.height
        self.howToPlayRabbit.frame = CGRect(x: width * 0.40, y: height * 0.23, width: width * 0.20, height: height * 0.1)
        animater3()
        
        func animater3() {
            UIView.animate(withDuration: 1, animations: {
                self.howToPlayRabbit.frame = CGRect(x: width * 0.40, y: height * 0.24, width: width * 0.20, height: height * 0.1)
            }, completion: { done in
                if done {
                    animaterRpt3()
                }
            })
        }
        
        func animaterRpt3() {
            UIView.animate(withDuration: 1, animations: {
                self.howToPlayRabbit.frame = CGRect(x: width * 0.40, y: height * 0.23, width: width * 0.20, height: height * 0.1)
            }, completion: { done in
                if done {
                    animater3()
                }
            })
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc fileprivate func willEnterForeground() {
        // refresh the label here
        animateView3()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        animateView3()
    }
    
    
    @IBOutlet weak var backgroundImageHowToPlay: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var howToPlayRabbit: UIImageView!
    @IBOutlet weak var matchUpLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages: [String] = ["page1","page2","page3","page4"]
    var frame = CGRect.zero
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    func setupScreens() {
                
        for index in 0..<pages.count {
            
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: pages[index])
            
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(pages.count)), height: scrollView.frame.size.height)
            scrollView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let width = view.frame.size.width
        let height = view.frame.size.height
        matchUpLabel.frame = CGRect(x: width * 0.1, y: height * 0.12, width: width * 0.80, height: height * 0.1)
        backgroundImageHowToPlay.frame = CGRect(x: width * 0, y: height * 0, width: width * 1, height: height * 1)
        pageControl.frame = CGRect(x: width * 0, y: height * 0.86, width: width * 1, height: height * 0.1)
        scrollView.frame = CGRect(x: width * 0, y: height * 0.38, width: width * 1, height: height * 0.479)
        
        pageControl.numberOfPages = pages.count
        setupScreens()
        
        scrollView.delegate = self

        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
}
