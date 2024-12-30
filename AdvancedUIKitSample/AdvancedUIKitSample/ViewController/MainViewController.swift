//
//  MainViewController.swift
//  AdvancedUIKitSample
//
//  Created by Robson Cesar de Siqueira on 30/12/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // UI Components
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "$125,367.10"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    private let percentageChangeLabel: UILabel = {
        let label = UILabel()
        label.text = "Today ↑ 6.40% ($7,540.88)"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGreen
        return label
    }()
    
    private let graphView: UIView = {
        let graphView = LineGraphView()
        graphView.translatesAutoresizingMaskIntoConstraints = false
        graphView.dataPoints = [10000, 12000, 11000, 13000, 12500]
        
        return graphView
    }()
    
    private let segmentControl: UISegmentedControl = {
        let items = ["1D", "1W", "1M", "3M", "6M", "1Y", "All"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    private let balanceDetailsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 16
        return stack
    }()
    
    private func createDetailLabel(title: String, value: String) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .gray
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.textColor = .black
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }
    
    private let depositButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Deposit", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let investButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Invest", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let liveEventBanner: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        
        let label = UILabel()
        label.text = "The Future of EdTech"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        
        let subLabel = UILabel()
        subLabel.text = "Hosted by Terry Ephron & Bodhi Lee"
        subLabel.font = UIFont.systemFont(ofSize: 12)
        subLabel.textColor = .gray
        
        let stack = UIStackView(arrangedSubviews: [label, subLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
        return view
    }()
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white

        let mainStack = UIStackView(arrangedSubviews: [
            balanceLabel,
            percentageChangeLabel,
            graphView,
            segmentControl,
            balanceDetailsStack,
            liveEventBanner
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.alignment = .fill
        
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        balanceDetailsStack.addArrangedSubview(createDetailLabel(title: "Equities", value: "$83,190.68"))
        balanceDetailsStack.addArrangedSubview(createDetailLabel(title: "Crypto", value: "$32,920.12"))
        balanceDetailsStack.addArrangedSubview(createDetailLabel(title: "Alts", value: "$7,634.40"))
        balanceDetailsStack.addArrangedSubview(createDetailLabel(title: "Cash", value: "$1,321.45"))
        
        let buttonStack = UIStackView(arrangedSubviews: [depositButton, investButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 16
        buttonStack.distribution = .fillEqually
        view.addSubview(buttonStack)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
