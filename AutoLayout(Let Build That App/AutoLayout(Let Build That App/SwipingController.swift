//
//  SwipingController.swift
//  AutoLayout(Let Build That App
//
//  Created by Danilo Rivera on 5/21/18.
//  Copyright © 2018 Danilo Rivera. All rights reserved.
//

import UIKit
struct Page {
    
    let imageName: String
    let headerText: String
    let subText: String
    
    
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    // Deal with landcape view
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }) { (_) in
            
        }
    }
    
    let pages = [
        Page(imageName: "bear", headerText: "Join us to play Game and Funs!", subText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon"),
        Page(imageName: "heart", headerText: "Subcribe today to get coupons in ouer daily events", subText: "Please watch any of our activities through this app"),
        Page(imageName: "leaf", headerText: "Become our VIP membership", subText: "Register to be our VIP member")
    ]
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self   , action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrev() {
        
        let prev = max(pageController.currentPage - 1, 0)
        let indexPath = IndexPath(item: prev, section: 0)
        pageController.currentPage = prev
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        
        let next = min(pageController.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: next, section: 0)
        pageController.currentPage = next
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.numberOfPages = pages.count
        pageController.currentPageIndicatorTintColor = .red
        pageController.pageIndicatorTintColor = .gray
        return pageController
    }()
    
    fileprivate func setUpButtonControl(){
        // UIStackView goes under here
        let controlUIStackView = UIStackView(arrangedSubviews: [prevButton, pageController, nextButton])
        controlUIStackView.distribution = .fillEqually
        controlUIStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controlUIStackView)
        
        
        // Instead of using .isActive = true we use NSLayoutConstraint.active...
        NSLayoutConstraint.activate([
            controlUIStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controlUIStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            controlUIStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            controlUIStackView.heightAnchor.constraint(equalToConstant: 50)])
        //        prevButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x/view.frame.width)
        print(x, view.frame.width, x/view.frame.width)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtonControl()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .cyan : .green
//        let imageName = imageNames[indexPath.item]
//        cell.imageView.image = UIImage(named: imageName)
//        cell.boldText.text = headerText[indexPath.item]
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    }
