//
//  ViewController.swift
//  3monthlesson53
//
//  Created by Iskhak Zhutanov on 26/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    var gameLevels: [GameLevel] = [GameLevel(img1: UIImage(named: "1_1")!, img2: UIImage(named: "2_1")!, img3: UIImage(named: "3_1")!, img4: UIImage(named: "4_1")!, answer: "FRUIT"), GameLevel(img1: UIImage(named: "1_2")!, img2: UIImage(named: "2_2")!, img3: UIImage(named: "3_2")!, img4: UIImage(named: "4_2")!, answer: "BALANCE"), GameLevel(img1: UIImage(named: "1_3")!, img2: UIImage(named: "2_3")!, img3: UIImage(named: "3_3")!, img4: UIImage(named: "4_3")!, answer: "WRESTLING")]
    
    var round = 0
    
    let alphabet: [String] = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"]
    
    var userWord: [String] = []
    
    var imageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    var imageViewOne: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        return view
    }()
    
    var imageViewTwo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        return view
    }()
    
    var imageViewThree: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        return view
    }()
    
    var imageViewFour: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var lettersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(LetterCell.self, forCellWithReuseIdentifier: "letter-cell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    lazy var userLettersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(LetterCell.self, forCellWithReuseIdentifier: "letter-cell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    var deleteButton = UIButton()
    
    var guessButton = UIButton()
    
    var resultView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
    }

    func layout() {
        let imageContainerViewWidth = view.frame.width - 60
        
        
        view.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imageContainerView.widthAnchor.constraint(equalToConstant: imageContainerViewWidth).isActive = true
        imageContainerView.heightAnchor.constraint(equalToConstant: imageContainerViewWidth).isActive = true
        
        
        imageContainerView.addSubview(imageViewOne)
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        imageViewOne.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 0).isActive = true
        imageViewOne.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 0).isActive = true
        imageViewOne.widthAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewOne.heightAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewOne.image = gameLevels[round].img1
        
        
        imageContainerView.addSubview(imageViewTwo)
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 0).isActive = true
        imageViewTwo.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: 0).isActive = true
        imageViewTwo.widthAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewTwo.heightAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewTwo.image = gameLevels[round].img2
        
        
        imageContainerView.addSubview(imageViewThree)
        imageViewThree.translatesAutoresizingMaskIntoConstraints = false
        imageViewThree.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 0).isActive = true
        imageViewThree.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 0).isActive = true
        imageViewThree.widthAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewThree.heightAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewThree.image = gameLevels[round].img3
        
        
        imageContainerView.addSubview(imageViewFour)
        imageViewFour.translatesAutoresizingMaskIntoConstraints = false
        imageViewFour.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 0).isActive = true
        imageViewFour.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: 0).isActive = true
        imageViewFour.widthAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewFour.heightAnchor.constraint(equalToConstant: imageContainerViewWidth / 2 - 5).isActive = true
        imageViewFour.image = gameLevels[round].img4
        
        
        view.addSubview(userLettersCollectionView)
        userLettersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        userLettersCollectionView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 20).isActive = true
        userLettersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        userLettersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        userLettersCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        view.addSubview(lettersCollectionView)
        lettersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        lettersCollectionView.topAnchor.constraint(equalTo: userLettersCollectionView.bottomAnchor, constant: 20).isActive = true
        lettersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lettersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lettersCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        view.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.setImage(UIImage(systemName: "delete.left.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)), for: .normal)
        deleteButton.backgroundColor = .blue
        deleteButton.tintColor = .white
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteLast), for: .touchUpInside)
        
        
        view.addSubview(guessButton)
        guessButton.translatesAutoresizingMaskIntoConstraints = false
        guessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        guessButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -20).isActive = true
        guessButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        guessButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        guessButton.layer.cornerRadius = 10
        guessButton.setTitle("Guess", for: .normal)
        guessButton.titleLabel?.font = guessButton.titleLabel?.font.withSize(25)
        guessButton.backgroundColor = .systemPink
        guessButton.tintColor = .white
        guessButton.setTitleColor(.white, for: .normal)
        guessButton.addTarget(self, action: #selector(guessPressed), for: .touchUpInside)
        
        
        view.addSubview(resultView)
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        resultView.isHidden = true
    }
    
    @objc func deleteLast() {
        if userWord.count > 0 {
            userWord.removeLast()
            userLettersCollectionView.reloadData()
        }
    }
    
    @objc func guessPressed() {
        let userGuess = userWord.reduce("", +)
        
        if userGuess == gameLevels[round].answer {
            self.resultView.isHidden = false
            self.resultView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.resultView.isHidden = true
                
                self.round += 1
                self.imageViewOne.image = self.gameLevels[self.round].img1
                self.imageViewTwo.image = self.gameLevels[self.round].img2
                self.imageViewThree.image = self.gameLevels[self.round].img3
                self.imageViewFour.image = self.gameLevels[self.round].img4
                
                self.userWord.removeAll()
                self.userLettersCollectionView.reloadData()
            }
        } else {
            self.resultView.isHidden = false
            self.resultView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.resultView.isHidden = true
                
                self.userWord.removeAll()
                self.userLettersCollectionView.reloadData()
            }
        }
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == lettersCollectionView {
            return alphabet.count
        } else {
            return userWord.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = lettersCollectionView.dequeueReusableCell(withReuseIdentifier: "letter-cell", for: indexPath) as! LetterCell
        
        if collectionView == lettersCollectionView {
            cell.letterLabel.text = alphabet[indexPath.row]
            cell.backgroundColor = .orange
            cell.layer.cornerRadius = 10
            cell.letterLabel.textColor = .white
            cell.userWordBackground.isHidden = true
            cell.letterLabel.font = cell.letterLabel.font.withSize(20)
        } else {
            cell.letterLabel.text = userWord[indexPath.row]
            cell.backgroundColor = .black
            cell.layer.cornerRadius = 10
            cell.userWordBackground.isHidden = false
            cell.letterLabel.font = cell.letterLabel.font.withSize(30)
        }
        
        return cell
    }
}


extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == userLettersCollectionView {
            return CGSize(width: 70, height: 70)
        } else {
            return CGSize(width: 40, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lettersCollectionView {
            if userWord.count < 10 {
                userWord.append(alphabet[indexPath.row])
                userLettersCollectionView.reloadData()
            }
        }
    }
}

