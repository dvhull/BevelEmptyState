//
//  ActivitiesView.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-31.
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ActivitiesHeaderView
            ActivitiesEmptyStateView
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScrollView {
        ActivitiesView()
    }
    .background(Color.background)
}

private extension ActivitiesView {
    var ActivitiesHeaderView: some View {
        Text("Activities")
            .font(UIFont.custom(size: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: 0.27))
            .fontDesign(.rounded)
    }
    
    var ActivitiesEmptyStateView: some View {
        VStack {
            HStack {
                Spacer()
                Text("No activities")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.customGray4)
                Spacer()
            }
            Text("There were no activities done this period.")
                .font(.system(.subheadline, design: .rounded))
                .bold()
                .foregroundColor(.customGray3)
        }
        .padding(.vertical, 40)
        // TODO: There is probably a better way to do this. For example hiding the TabBar.
        .padding(.bottom, 30)
    }
}
