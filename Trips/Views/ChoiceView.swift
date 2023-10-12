

import UIKit

final class ChoiceView: UIView {
    
    private let searchTextField = UITextField()
    private let choiceLocationImageView = UIImageView()
    
    init(_ image: UIImage?, _ placeholderText: String) {
        super.init(frame: .zero)
        prepareUI(image, placeholderText)
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

private extension ChoiceView {
    func prepareUI(_ image: UIImage?, _ placeholderText: String) {
        layer.cornerRadius = 10
        backgroundColor = .white
        
        choiceLocationImageView.image = image
        choiceLocationImageView.tintColor = UIColor(named: "Pink")
    }
    
    func prepareLayout() {
        [choiceLocationImageView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            
            choiceLocationImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            choiceLocationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            choiceLocationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choiceLocationImageView.widthAnchor.constraint(equalTo: choiceLocationImageView.heightAnchor),
        ])
    }
}
