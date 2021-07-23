//
//  UIViewExtension.swift
//  OneTwoThreeApp
//
//  Created by Orawan Manasombun on 23/6/21.
//  Copyright © 2021 2C2P. All rights reserved.
//

import UIKit

extension UIView {
    
    static let loadingViewTag = 1938123987
    static let containerViewTag = 1938123988
    
    var width: CGFloat {
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
    
    static func fromNib<T: UIView>() -> T? {
        return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
    }
    
    class func loadFromNib() -> UIView? {
        let bundle : Bundle? = nil
        return UINib( nibName: String(describing: self),bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func dropShadow(color:UIColor = .black, opacity: Float = 0.15, radius: CGFloat = 6, offset:CGSize = CGSize(width: 0, height: 2), scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addBorder(withColor color: UIColor = .clear, width: CGFloat = 0, roundRadius: CGFloat) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = roundRadius
        clipsToBounds = false
    }
    
    func removeBorder() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 0
        clipsToBounds = false
    }

    
    func aspectRatio(_ ratio: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0)
    }
    
    func rounded() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    // MARK: - Loading Views
    
    func showLoading() {
        guard let window = UIApplication.shared.keyWindow else {  return  }
        guard window.viewWithTag(UIView.loadingViewTag) == nil else {  return  }
        guard window.viewWithTag(UIView.containerViewTag) == nil else {  return  }
        
        let container: UIView = UIView(frame: window.frame)
        container.center = window.center
        container.isOpaque = true
        container.backgroundColor = Colors.white.value.withAlphaComponent(0.3)
        container.tag = UIView.containerViewTag
        
        let loadingView: UIView = UIView(frame: CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: 65, height: 65))
        loadingView.center = window.center
        loadingView.backgroundColor = UIColor(hexString: "#5E5E5E5E").withAlphaComponent(0.6)
        loadingView.clipsToBounds = true
        loadingView.isOpaque = true
        loadingView.layer.cornerRadius = 10
        loadingView.tag = UIView.loadingViewTag
        loadingView.dropShadow()
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: loadingView.frame)
        if #available(iOS 13.0, *) {
            actInd.style = .large
        } else {
            actInd.style = .whiteLarge
        }
        actInd.center = CGPoint(x: (loadingView.frame.size.width / 2) + 1, y: (loadingView.frame.size.height / 2) + 1)
        actInd.color = .white
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        
        actInd.accessibilityIdentifier = "loading_actInd"
        loadingView.accessibilityIdentifier = "loading_view"
        container.accessibilityIdentifier = "loding_container"
        
        window.addSubview(container)
        window.bringSubviewToFront(container)
        actInd.startAnimating()
    }
    
    func hideLoading() {
        guard let window = UIApplication.shared.keyWindow else {  return  }
        
        let loading = window.viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
        let container = window.viewWithTag(UIView.containerViewTag)
        container?.removeFromSuperview()
    }
}
