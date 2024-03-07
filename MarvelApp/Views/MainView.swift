//
//  ViewController.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    let heroViewModel: HeroesViewModel
    
    init(heroViewModel: HeroesViewModel) {
        self.heroViewModel = heroViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundScreen: UIView = {
        let backgroundScreen = UIView()
        backgroundScreen.translatesAutoresizingMaskIntoConstraints = false
        backgroundScreen.backgroundColor = UIColor(named: "main-color")
        return backgroundScreen
    }()
    
    private lazy var marvelLogo: UIImageView = {
        let marvelLogo = UIImageView()
        marvelLogo.translatesAutoresizingMaskIntoConstraints = false
        marvelLogo.image = UIImage(named: "marvel-logo")
        marvelLogo.contentMode = .scaleAspectFit
        return marvelLogo
    }()
    
    private lazy var titleText: UILabel = {
        let titleText = UILabel()
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.text = "Choose your hero"
        titleText.font = .systemFont(ofSize: 30, weight: .bold)
        titleText.textColor = .white
        titleText.textAlignment = .center
        return titleText
    }()
    
    private lazy var pagingLayout: PagingCollectionViewLayout = {
        let layout = PagingCollectionViewLayout()
        layout.sectionInset = .init(top: 0, left: spacing, bottom: 0, right: spacing)
        layout.minimumLineSpacing = cellSpacing
        layout.itemSize = .init(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: pagingLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .clear
        collectionView.register(CustomHeroCollectionViewCell.self, forCellWithReuseIdentifier: CustomHeroCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    private lazy var coloredFrame: ColoredFrameView = {
        let coloredFrame = ColoredFrameView(colorFrame: heroViewModel.dataSource[0].backgroundColor)
        coloredFrame.translatesAutoresizingMaskIntoConstraints = false
        return coloredFrame
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        
        view.addSubview(backgroundScreen)
        backgroundScreen.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        backgroundScreen.addSubview(coloredFrame)
        coloredFrame.backgroundColor = .clear
        
        backgroundScreen.addSubview(marvelLogo)
        marvelLogo.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.backgroundScreen.snp.top).offset(70)
            make.centerX.equalTo(self.backgroundScreen.snp.centerX)
            make.height.equalTo(45)
        }
        
        backgroundScreen.addSubview(titleText)
        titleText.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.marvelLogo.snp.bottom).offset(40)
            make.width.equalTo(self.backgroundScreen.snp.width)
        }
        
        backgroundScreen.addSubview(collectionView)
        collectionView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(titleText.snp.bottom)
            make.width.equalTo(backgroundScreen.snp.width)
            make.bottom.equalTo(backgroundScreen.snp.bottom)
        }
        
    }
    
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroViewModel.countOfHeroes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHeroCollectionViewCell.identifier, for: indexPath) as? CustomHeroCollectionViewCell else { return UICollectionViewCell() }
        
        let hero = heroViewModel.dataSource[indexPath.row]
        coloredFrame.colorFrame = hero.backgroundColor
        coloredFrame.setNeedsDisplay()
        cell.configure(with: hero)
        
        return cell
    }
}

class ColoredFrameView: UIView {
    
    var colorFrame: UIColor{
        didSet{
            drawTriangle(color: colorFrame)
        }
    }
    
    init(colorFrame: UIColor) {
        self.colorFrame = colorFrame
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.3, width: UIScreen.main.bounds.width, height: cellHeight + 50))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        drawTriangle(color: colorFrame)
    }
    
    func drawTriangle(color: UIColor) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: UIScreen.main.bounds.width, y: cellHeight + 50))
        path.addLine(to: CGPoint(x: 0, y: cellHeight + 50))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        
        let fillColor = color
        fillColor.setFill()
        path.fill()
        path.stroke()
    }
}
