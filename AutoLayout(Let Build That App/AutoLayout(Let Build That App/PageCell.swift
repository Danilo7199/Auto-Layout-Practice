//
//  PageCell.swift
//  AutoLayout(Let Build That App
//
//  Created by Danilo Rivera on 5/31/18.
//  Copyright © 2018 Danilo Rivera. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    // Let's avoid viewDidLoad() pollutiing
    // {} is the closure or annon. function
    var page: Page? {
        didSet{
//            print(page?.imageName)
            guard let unwraping = page else {
                return
            }
            
            
            imageView.image = UIImage(named: unwraping.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwraping.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n" + unwraping.subText, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    //  Bear Logo
    
    private let imageView: UIImageView = {
        let bearLogo = UIImageView(image: #imageLiteral(resourceName: "bear"))
        // AutoLayout go here
        bearLogo.translatesAutoresizingMaskIntoConstraints = false
        return bearLogo
    }()
    
    // Bold text Discribtion
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .purple
        setUpLayout()
    }
    private func setUpLayout(){
        
        let topImageView = UIView()
        //        topImageView.backgroundColor = .cyan
        addSubview(topImageView)
        // Enable AutoLayout
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        topImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        topImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //        leftAnchor and rightAnchor are not really recommanded by apple
        //        so leadingAnchor and trailingAnchor are those in which recommaded one
        
        topImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // bear logo properties
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
        topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
//         Bold text Discribtion
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
