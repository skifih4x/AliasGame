//
//  RulesViewController.swift
//  AliasGame
//
//  Created by Артем Орлов on 27.07.2022.
//

import UIKit

class RulesViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView =  {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mainTitleLabel: TitleLabel = {
        let titelLabel = TitleLabel()
        titelLabel.text = Rules.mainTitle
        return titelLabel
    }()
    
    private lazy var explanationTitleLabel: TitleLabel = {
        let titelLabel = TitleLabel()
        titelLabel.text = Rules.explanationTitle
        return titelLabel
    }()
    
    private lazy var scoreTitleLabel: TitleLabel = {
        let titelLabel = TitleLabel()
        titelLabel.text = Rules.scoreTitle
        return titelLabel
    }()
    
    private lazy var controlTitleLabel: TitleLabel = {
        let titelLabel = TitleLabel()
        titelLabel.text = Rules.controlTitle
        return titelLabel
    }()
    
    private lazy var mainLabel: TextLabel = {
        let textLabel = TextLabel()
        textLabel.text = Rules.main
        return textLabel
    }()
    
    private lazy var explanationLabel: TextLabel = {
        let textLabel = TextLabel()
        textLabel.text = Rules.explanation
        return textLabel
    }()
    
    private lazy var scoreLabel: TextLabel = {
        let textLabel = TextLabel()
        textLabel.text = Rules.score
        return textLabel
    }()
    
    private lazy var controlLabel: TextLabel = {
        let textLabel = TextLabel()
        textLabel.text = Rules.control
        return textLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupView()
        setConstrains()
    }
    
    private func setupNavigation() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = Rules.title
        
        let exitButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(exitButtonTapped))
        
        self.navigationItem.setLeftBarButton(exitButton, animated: true)
    }
    
    private func setupView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubview(stackView)
        
        stackView.addArrangedSubview(mainTitleLabel)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(explanationTitleLabel)
        stackView.addArrangedSubview(explanationLabel)
        stackView.addArrangedSubview(scoreTitleLabel)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(controlTitleLabel)
        stackView.addArrangedSubview(controlLabel)
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
        ])
    }
    
    @objc private func exitButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        self.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TextLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.textColor = .black
        
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
