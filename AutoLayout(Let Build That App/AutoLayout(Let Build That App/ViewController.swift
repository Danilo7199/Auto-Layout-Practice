

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    
}

class ViewController: UIViewController {
    // Let's avoid viewDidLoad() pollutiing
    // {} is the closure or annon. function
    
    //  Bear Logo
    let imageView: UIImageView = {
        let bearLogo = UIImageView(image: #imageLiteral(resourceName: "bear"))
        // AutoLayout go here
        bearLogo.translatesAutoresizingMaskIntoConstraints = false
        return bearLogo
    }()
    
    // Bold text Discribtion
    let boldText: UITextView = {
        let bText = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join the Game and Have Fun!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        bText.attributedText = attributedText
        
        bText.translatesAutoresizingMaskIntoConstraints = false
        bText.textAlignment = .center
        bText.isEditable = false
        bText.isScrollEnabled = false
        return bText
    }()
    
     private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.numberOfPages = 4
        pageController.currentPageIndicatorTintColor = .mainPink
        pageController.pageIndicatorTintColor = .gray
        return pageController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(boldText)
        setUpLayout()
        setUpButtonControl()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    private func setUpLayout(){
        
        
        let topImageView = UIView()
//        topImageView.backgroundColor = .cyan
        view.addSubview(topImageView)
        // Enable AutoLayout
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        topImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        leftAnchor and rightAnchor are not really recommanded by apple
//        so leadingAnchor and trailingAnchor are those in which recommaded one
        
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // bear logo properties
        topImageView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        // Bear Logo
//        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//
        // Bold text Discribtion
        boldText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70).isActive = true
        boldText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        boldText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        boldText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        

    }
}














