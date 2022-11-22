//
//  WeatherCollectionView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 20/11/2022.
//

import UIKit

class WeatherCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    var model: WeatherModel?


    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .green

        delegate = self
        dataSource = self

        self.register(WeatherCollectionViewCell.self,
                      forCellWithReuseIdentifier: WeatherCollectionViewCell.reuseIdentifer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reuseIdentifer, for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let model = model {
            cell.configure(model: model)
            print("la celle est configurée")
        }
        cell.backgroundColor = .purple
        return cell
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("la cell est créée")
        return CGSize(width: frame.width, height: frame.height / 2.5)
    }
}
