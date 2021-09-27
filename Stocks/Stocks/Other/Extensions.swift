//
//  Extensions.swift
//  Stocks
//
//  Created by Gaston Seneza on 9/26/21.
//

import Foundation
import UIKit

//MARK: - Framing

extension UIView {
    var width: CGFloat {
        frame.size.width
    }
    var height: CGFloat {
        frame.size.height
    }
    var left: CGFloat {
        frame.origin.x
    }
    var right: CGFloat {
        left + width
    }
    var top: CGFloat {
        frame.origin.y
    }
    var bottom: CGFloat {
        top + height
    }
}

// MARK: - Add Subview

extension UIView {
    /*
     -Parameter: variadic parameter `views` allows us to pass in multiple params
     */
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
        
    }
}
