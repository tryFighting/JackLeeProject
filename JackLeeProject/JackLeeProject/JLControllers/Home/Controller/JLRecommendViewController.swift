//
//  JLRecommendViewController.swift
//  JackLeeProject
//
//  Created by zrq on 2019/5/16.
//  Copyright © 2019 com.baidu.www. All rights reserved.
//

import UIKit

class JLRecommendViewController: JLBaseViewController {

    ///穿插的广告数据
    private var recommandAdverList:[JLRecommandAbvertModel]?
    
    //cell注册
    private let JLRecommendHeaderViewID = "HeaderView"
    private let JLRecommendFooterViewID = "FooterView"
    
    //注册不同的cell
    private let JLRecommandHeaderCellID = "HeaderCell"
    //猜你喜欢
    private let JLRecommandGuessLikeCellID = "GuessLike"
    //热门有声书
    private let JLHotAudioBookCellID = "AudioBook"
    //广告
    private let JLAdvertCellID = "AdvertCell"
    //懒人电台
    private let JLOneKeyListenCellID = "ListenCell"
    //为你推荐
    private let JLRecommendYouCellID = "RecommandYou"
    //推荐直播
    private let JLRecommandLiveCellID = "LiveCell"
    
    ///懒加载
    lazy var collectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        ///注册头视图和尾视图
       collection.register(JLRecommandHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: JLRecommendHeaderViewID)
        collection.register(JLRecommandFootView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: JLRecommendFooterViewID)
       
        
        //注册不同区分的cell
        //默认
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collection.register(JLRecommendHeaderCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(JLRecommendHeaderCell.self, forCellWithReuseIdentifier: JLRecommandHeaderCellID)
        

        return collection
    }()
    //懒加载viewmodel
    lazy var viewModel: JLRecommandViewModel = {
        return JLRecommandViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加滑动视图 collectionview
        view.addSubview(self.collectionView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
extension JLRecommendViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
