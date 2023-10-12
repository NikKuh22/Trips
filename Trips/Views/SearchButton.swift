

import UIKit

final class SearchButton: UIButton {
    
    init(_ style: SearchButtonStyle = .active) {
        super.init(frame: .zero)
        
        prepareUI(style)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

extension SearchButton{
    private func prepareUI(_ style: SearchButtonStyle){
        setTitle("Search", for: .normal)
        setTitleColor(style.textColor, for: .normal)
        
        layer.cornerRadius = 20
        
        titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        backgroundColor = style.backgroundColor
        isEnabled = style.isEnabled
    }
    
    func changeStyle(_ style: SearchButtonStyle) {
        isEnabled = false
        UIView.animate(withDuration: 0.25) {
            self.prepareUI(style)
        } completion: { _ in
            self.isEnabled = style.isEnabled
        }
    }
}

extension SearchButton {
    enum SearchButtonStyle {
        case active
        case notActive
        
        var backgroundColor: UIColor? {
            switch self {
            case .active:
                return UIColor(named: "Pink")
            case .notActive:
                return .gray
            }
        }
        
        var textColor: UIColor? {
            switch self {
            case .active:
                return .white
            case .notActive:
                return .black
            }
        }
        
        var isEnabled: Bool {
            switch self {
            case .active:
                return true
            case .notActive:
                return false
            }
        }
    }
}
