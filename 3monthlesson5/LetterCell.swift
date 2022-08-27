import UIKit

class LetterCell: UICollectionViewCell {
    
    var letterLabel = UILabel()
    
    var userWordBackground = UIView()
    
    override func layoutSubviews() {
        addSubview(userWordBackground)
        userWordBackground.translatesAutoresizingMaskIntoConstraints = false
        userWordBackground.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        userWordBackground.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        userWordBackground.heightAnchor.constraint(equalToConstant: 65).isActive = true
        userWordBackground.widthAnchor.constraint(equalToConstant: 65).isActive = true
        userWordBackground.layer.cornerRadius = 8
        userWordBackground.backgroundColor = .white
        
        
        addSubview(letterLabel)
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
}
