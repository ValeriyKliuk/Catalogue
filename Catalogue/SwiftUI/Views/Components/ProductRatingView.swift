//
//  RatingRowView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-05.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import SwiftUI

@available(iOS 17.0.0, *)
struct ProductRatingView: View {
    @Binding var rating: Int?
    var title: String
    
    private func starName(for index: Int) -> String {
        guard let rating = self.rating else { return "star"}
        
        if index <= Int(rating) {
            return "star.fill"
        }
        return "star"
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starName(for: index))
                    .foregroundStyle(.yellow)
                    .font(.title)
                    .onTapGesture(coordinateSpace: .local) { point in
                        self.rating = index
                    }
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 1)
    }
}
