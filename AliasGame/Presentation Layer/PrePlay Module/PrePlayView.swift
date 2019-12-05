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
    
    func setSingleScreens(models: [SingleScreenModel]) {
        self.models = models
        DispatchQueue.main.async {
            self.setupPageControl()
            self.setupBarButtons()
            self.setupScreenViews()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutScrollView()
        layoutPageControl()
        layoutScreenViews()
    }
    
    // MARK: - Элементы UI
    
    let scrollView = UIScrollView(frame: .zero)
    
    let pageControl = UIPageControl(frame: .zero)
    
    let stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    
    var screenViews: [SingleScreenView] = []
    
    // MARK: - Настройка элементов UI
    
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
    }
    
    private func setupScreenViews() {
        for (index, model) in models.enumerated() {
            let customView: UIView
            switch index {
            case 0: customView = FirstView(image: #imageLiteral(resourceName: "game-mode-2"))
            case 1: customView = SecondView(image: #imageLiteral(resourceName: "game-mode-3"))
            case 2: customView = ThirdView(image: #imageLiteral(resourceName: "game-mode-5"))
            case 3: customView = FourthView(image: #imageLiteral(resourceName: "game-mode-6"))
            case 4: customView = FifthView(emoji: "👍")
            default: customView = .init()
            }
            let singleScreenView = SingleScreenView()
            singleScreenView.loadModel(model: model)
            singleScreenView.loadCustimView(customView: customView)
            scrollView.addSubview(singleScreenView)
            switch index {
            case 0: fallthrough
            case 1: fallthrough
            case 2: fallthrough
            case 3: singleScreenView.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            case 4: singleScreenView.button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
            default: break
            }
            screenViews.append(singleScreenView)
        }
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
        pageControl.frame = CGRect(x: 0, y: 0.90 * view.bounds.height,
                                   width: view.bounds.width, height: 80)
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

}

extension PrePlayView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPageIndex = Int((scrollView.contentOffset.x + view.bounds.width / 2) / view.bounds.width)
        if currentPageIndex < models.count {
            pageControl.currentPage = currentPageIndex
            pageControl.currentPageIndicatorTintColor = models[currentPageIndex].color
        }
    }
}
