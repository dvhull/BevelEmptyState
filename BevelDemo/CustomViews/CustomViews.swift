//
//  CustomViews.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-31.
//

import SwiftUI

// TODO: This should be seperate into files IE. Buttons, Backgrounds etc... this probably can be better organized.
struct BackgroundContainerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(Color.white)
            .strokeBorder(
                LinearGradient(gradient: Gradient(colors: [.white, .customGray2]), startPoint: .top, endPoint: .bottom),
                    lineWidth: 2
            )
    }
}

struct BackgroundContainerShadowView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(Color.white)
                .strokeBorder(
                    LinearGradient(gradient: Gradient(colors: [.white, .customGray2]), startPoint: .top, endPoint: .bottom),
                    lineWidth: 2
                )
                .shadow(color: .containerShadow, radius: 5, x: 0, y: 2)
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
                .padding(2)
        }
    }
}

struct BackgroundCapsuleShadowView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50.0)
                .fill(Color.white)
                .strokeBorder(
                    LinearGradient(gradient: Gradient(colors: [.white, .customGray2]), startPoint: .top, endPoint: .bottom),
                    lineWidth: 1
                )
                .shadow(color: .customGray3, radius: 5, x: 0, y: 4)
            RoundedRectangle(cornerRadius: 50.0)
                .foregroundColor(.white)
                .padding(1)
        }
    }
}

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.customGray2)
            .frame(width: 1)
            .padding(.horizontal, 5)
    }
}
