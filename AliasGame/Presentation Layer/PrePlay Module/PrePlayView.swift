//
//  PrePlayView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 02/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PrePlayView: AliasLightViewController {

    private let presenter: PrePlayPresenterInput
    
    var models: [SingleScreenModel] = []
    
    
    init(presenter: PrePlayPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        setupScrollView()
        presenter.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutScrollView()
        layoutPageControl()
        layoutScreenViews()
    }
    
    // MARK: - Элементы UI
    
    var gameInformationLabel: UITextView?
    
    let scrollView = UIScrollView(frame: .zero)
    
    let pageControl = UIPageControl(frame: .zero)
    
    let stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    
    var screenViews: [SingleScreenView] = []
    
    private var roundsCustomControl: AliasSegmentedControl?
    private var timeForSetCustomControl: AliasSegmentedControl?
    
    // MARK: - Настройка элементов UI
    
    private func setupScreenViews(mode: AliasGameMode) {
        for (index, model) in models.enumerated() {
            let singleScreenView = SingleScreenView()
            let customView: UIView
            var customControl: UIView?
            switch index {
            case 0: customView = FirstView(image: mode.image)
            case 1: customView = SecondView(image: #imageLiteral(resourceName: "game-mode-3"))
            case 2: customView = ThirdView(image: #imageLiteral(resourceName: "game-mode-5"))
            let aliasSegmentedControl = AliasSegmentedControl(segments: ["3", "4", "5", "6", "7"], color: model.color)
            customControl = aliasSegmentedControl
            roundsCustomControl = aliasSegmentedControl
            case 3: customView = FourthView(image: #imageLiteral(resourceName: "game-mode-6"))
            let aliasSegmentedControl = AliasSegmentedControl(segments: ["15 с", "30 с", "1 м", "2 м", "3 м"], color: model.color)
            customControl = aliasSegmentedControl
            timeForSetCustomControl = aliasSegmentedControl
            case 4: customView = FifthView(emoji: "🐣")
            gameInformationLabel = singleScreenView.textLabel
            default: customView = .init()
            }
            singleScreenView.loadModel(model: model)
            singleScreenView.loadCustomView(customView: customView)
            if let customControl = customControl {
                singleScreenView.loadCustomControl(customControl: customControl)
            }
            scrollView.addSubview(singleScreenView)
            switch index {
            case 0: singleScreenView.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            case 1: fallthrough
            case 2: fallthrough
            case 3: break
            case 4: singleScreenView.button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
            default: break
            }
            screenViews.append(singleScreenView)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
    }
    
    private func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.pageIndicatorTintColor = .groupTableViewBackground
        pageControl.currentPageIndicatorTintColor = models[0].color
        pageControl.currentPage = 0
        pageControl.numberOfPages = models.count
        pageControl.isEnabled = false
    }
    
    /// Настройка кнопок паузы и выхода
    private func setupBarButtons() {
        stopBarButtonItem.target = self
        stopBarButtonItem.action = #selector(stopBarButtonTapped)
        navigationItem.leftBarButtonItem = stopBarButtonItem
    }
    
    // MARK: - Настройка layout
    
    private func layoutScrollView() {
        scrollView.frame = view.bounds.inset(by: view.safeAreaInsets)
        let height = scrollView.frame.height
        let width = CGFloat(integerLiteral: screenViews.count) * view.frame.width
        scrollView.contentSize = CGSize(width: width, height: height)
        let contentOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(contentOffset, animated: false)
    }
    
    private func layoutPageControl() {
        let height: CGFloat = 44.0
        let yOffset: CGFloat = view.bounds.height > 600 ? 32.0 : 16.0
        pageControl.frame = CGRect(x: 0, y:  view.frame.height - height - yOffset,
                                   width: view.bounds.width,
                                   height: height)
    }
    
    private func layoutScreenViews() {
        for (index, screenView) in screenViews.enumerated() {
            let screenViewXOffset = CGFloat(integerLiteral: index) * scrollView.bounds.width
            screenView.frame = scrollView.bounds.offsetBy(dx: screenViewXOffset, dy: 0)
        }
    }
    
    // MARK: - Обработка нажатий клавиш
    
    @objc func stopBarButtonTapped() {
        presenter.exitTapped()
    }
    
    @objc func startGameButtonTapped() {
        presenter.startGameButtonTapped()
    }
    
    @objc func nextButtonTapped() {
        let currentPageIndex = Int((scrollView.contentOffset.x + view.bounds.width / 2) / view.bounds.width)
        let contentOffset = CGPoint(x: (CGFloat(integerLiteral: currentPageIndex) + 1) * view.bounds.width, y: 0)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
}

extension PrePlayView: PrePlayPresenterOutput {
    
    func setSingleScreens(models: [SingleScreenModel], mode: AliasGameMode) {
        self.models = models
        DispatchQueue.main.async {
            self.setupPageControl()
            self.setupBarButtons()
            self.setupScreenViews(mode: mode)
        }
    }

    
    func setGameInformationText(text: String) {
        DispatchQueue.main.async {
            guard let gameInformationLabel = self.gameInformationLabel else {
                debugPrint("[PrePlayView]: gameInformationLabel is nil")
                return
            }
            gameInformationLabel.text = text
            if let lastScreenView = self.screenViews.last {
                lastScreenView.layoutSubviews()
            }
        }
    }
    
    
    var configuredTimeForSet: Int {
        let index = timeForSetCustomControl?.selectedSegmentIndex ?? 2
        switch index {
        case 0: return 15
        case 1: return 30
        case 2: return 60
        case 3: return 120
        case 4: return 180
        default: return 60
        }
    }
    var configuredNumberOfRounds: Int {
        let index = roundsCustomControl?.selectedSegmentIndex ?? 2
        switch index {
        case 0: return 3
        case 1: return 4
        case 2: return 5
        case 3: return 6
        case 4: return 7
        default: return 5
        }
    }

}

extension PrePlayView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPageIndex = Int((scrollView.contentOffset.x + view.bounds.width / 2) / view.bounds.width)
        if currentPageIndex < models.count {
            pageControl.currentPage = currentPageIndex
            pageControl.currentPageIndicatorTintColor = models[currentPageIndex].color
        }
        if currentPageIndex == models.count - 1 {
            presenter.didReachLastPage()
        }
    }
}
