import UIKit

final class MainHeaderView: UIView {
    
    private let mainTextLabel = UILabel()
    private let logoImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        prepareUI()
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareUI()
        prepareLayout()
    }
}

private extension MainHeaderView {
    func prepareUI() {
        backgroundColor = UIColor(named: "Pink")
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        logoImageView.image = UIImage(systemName: "airplane")
        logoImageView.tintColor = .white
        
        mainTextLabel.text = "Welcome\nto Trips"
        mainTextLabel.numberOfLines = 0
        mainTextLabel.textColor = .white
        mainTextLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
    }
    
    func prepareLayout() {
        [mainTextLabel, logoImageView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            mainTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainTextLabel.trailingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: -10),
            mainTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoImageView.centerYAnchor.constraint(equalTo: mainTextLabel.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
