//
//  LogoHeaderUIView.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 14/07/2022.
//

import UIKit

class LogoHeaderUIView: UIView {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
         imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        logoImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
