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

// TODO: Probably a better way to do this.
struct TextWithWeight: UIViewRepresentable {
    let text: String
    let weight: CGFloat

    typealias UIViewType = UITextView

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.text = text
        view.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize,
            weight: UIFont.Weight(rawValue: weight) // Convert CGFloat to UIFont.Weight
        )
        view.isScrollEnabled = false
        view.isEditable = false
        view.isSelectable = false
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize,
            weight: UIFont.Weight(rawValue: weight)
        )
    }

    @MainActor func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        return uiView.sizeThatFits(proposal.replacingUnspecifiedDimensions())
    }
}
