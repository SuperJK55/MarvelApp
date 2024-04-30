//
//  ViewController.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 07.03.2024.
//

import UIKit
import SnapKit
import CollectionViewPagingLayout

class MainViewController: UIViewController {
    
    let heroViewModel: APIWork
    
    init(heroViewModel: APIWork) {
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
    
    private lazy var pagingLayout: CollectionViewPagingLayout = {
        let layout = CollectionViewPagingLayout()
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: pagingLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = true
        collectionView.register(CustomHeroCollectionViewCell.self, forCellWithReuseIdentifier: CustomHeroCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.contentSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    private lazy var triangleView: TriangleView = {
        let triangleView = TriangleView(colorFrame: UIColor.red)
        triangleView.backgroundColor = .clear
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        return triangleView
    }()
    
    private func updateData() {
        LoaderView.loaderActivate()
        heroViewModel.fetchHeroesData() { [weak self] (result) in
            guard let this = self else { return }
            this.resultFromApi(result)
        }
    }
    private func resultFromApi(_ result: Result<[HeroModel], Error>) {
        switch result {
        case .success(let model):
            setupViewConstraints()
            LoaderView.loaderDeactivate()
        case .failure(let error):
            LoaderView.loaderDeactivate()
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    private func setupViewConstraints() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(backgroundScreen)
        backgroundScreen.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        backgroundScreen.addSubview(triangleView)
        
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroViewModel.countOfHeroes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHeroCollectionViewCell.identifier, for: indexPath) as? CustomHeroCollectionViewCell else { return UICollectionViewCell() }
        
        let hero = heroViewModel.dataSource[indexPath.row]
        cell.configure(viewModel: InfoAboutHero(hero: hero))
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let hero = heroViewModel.dataSource[indexPath.row]
        let infoAboutHeroesViewController = InfoAboutHeroesViewController(hero: hero)
        self.navigationController?.pushViewController(infoAboutHeroesViewController, animated: true)
    }
}

extension MainViewController {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: pagingLayout.currentPage, section: 0)
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomHeroCollectionViewCell else { return }
        triangleView.colorFrame = cell.heroImageView.image?.averageColor() ?? UIColor.systemRed
    }
}




