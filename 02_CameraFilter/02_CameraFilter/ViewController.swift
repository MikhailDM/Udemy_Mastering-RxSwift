//
//  ViewController.swift
//  02_CameraFilter
//
//  Created by Михаил Дмитриев on 27.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var applyButton: UIButton!
    
    
//MARK: - PROPERTIES
    let disposeBag = DisposeBag()
    
    
//MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        //Большой заголовок
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
            let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
                fatalError("Destinanion is not found")
        }
        //Подписываемся
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
            }).disposed(by: disposeBag)
    }
    
//MARK: - ACTIONS
    @IBAction func applyFilterButtonPressed(_ sender: Any) {
        guard let sourceImage = self.photoImageView.image else {return}
        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filteredImage in
                DispatchQueue.main.async {
                    self.photoImageView.image = filteredImage
                }
            }).disposed(by: disposeBag)
    }
    
    
//MARK: - PRIVATE
    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.applyButton.isHidden = false
    }

}

