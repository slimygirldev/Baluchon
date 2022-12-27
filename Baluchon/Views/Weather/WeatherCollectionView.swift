//
//  WeatherCollectionView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 20/11/2022.
//

import UIKit

class WeatherCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    var models: [WeatherModel] = []
    let horizontalPadding: Int = 16


    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .systemBackground

        delegate = self
        dataSource = self

        self.register(WeatherCollectionViewCell.self,
                      forCellWithReuseIdentifier: WeatherCollectionViewCell.reuseIdentifer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reuseIdentifer, for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        //permet de savoir quel model on doit utilisé pour configurer une cell telle qu'on la veut
        // le if est une securité pr que le code ne crash pas au cas où indexpath serait vide
        // on s'assure grace au if que la valeur d'indexpath est tjrs inferieur au nombre d'element dans le model
        if indexPath.row < models.count {
            let model = models[indexPath.row]
            cell.configure(model: model)
        }
        return cell
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - CGFloat(horizontalPadding * 2), height: frame.height / 2.2)
    }
}