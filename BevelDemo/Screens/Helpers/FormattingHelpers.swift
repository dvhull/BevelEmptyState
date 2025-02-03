//
//  FormattingHelpers.swift
//  BevelDemo
//
//  Created by David Hull on 2025-02-03.
//

import Foundation
import SwiftUI

extension UIFont {
    static func custom(size: CGFloat, weight: CGFloat) -> Font {
        Font(UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: weight)))
    }
}
