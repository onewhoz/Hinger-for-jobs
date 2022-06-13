//
//  OnboardingViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/3/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
                
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
            OnboardingSlide(title: "Simple", description: "Hire with no limits with Port to port services", image: #imageLiteral(resourceName: "work1")),
            OnboardingSlide(title: "Interactive", description: "Find a perfect fit for your company", image: #imageLiteral(resourceName: "work2")),
            OnboardingSlide(title: "Effective", description: "Your job in a dream country", image: #imageLiteral(resourceName: "work3")),
           
        ]
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
        
           // let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            Coordinator.changeViewControllerWithIdentifier("LoginVC")
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionVIew.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
        
     
    }
}

extension OnboardingViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
