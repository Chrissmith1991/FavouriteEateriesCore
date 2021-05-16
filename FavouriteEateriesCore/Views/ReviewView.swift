//
//  ReviewView.swift
//  FavouriteEateriesCore
//
//  Created by Christopher Smith on 16/5/21.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eatery: Eatery
    var body: some View {
        VStack {
            HStack {
                Text("User Reviews:")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                Spacer()
                EditButton()
                Button(action: {
                    withAnimation {
                        eatery.create()
                        try? viewContext.save()
                    }
                }, label: { Image(systemName: "plus") })
            }.background(Color.orange)
            List {
                ForEach(eatery.allReviews) { review in
                    ReviewContentView(review: review)
                }.onDelete(perform: { offsets in
                    eatery.destroy(offsets: offsets)
                    try? viewContext.save()
                }).onMove(perform: { indices, newOffset in
                    eatery.move(from: indices, to: newOffset)
                })
            }
        }
    }
}

struct ReviewContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var mode
    @ObservedObject var review: Review
    var body: some View {
        VStack {
            HStack {
                if mode?.wrappedValue == .active {
                    HStack { Text("Edit: "); TextField("Username Field", text: $review.userName, onCommit: {
                        try? viewContext.save()
                    })}
                    Divider()
                    HStack { Text("Edit: "); TextField("Rating Field", value: $review.reviewRating, formatter: NumberFormatter(), onCommit: {
                        try? viewContext.save()
                    })}
                } else {
                    Text(review.userName)
                    Divider()
                    Text("Raiting: \(review.reviewRating)")
                }
            }
            if mode?.wrappedValue == .active {
                HStack { Text("Edit: "); TextField("Content Field", text: $review.reviewContent, onCommit: {
                    try? viewContext.save()
                })}
            } else {
                Text(review.reviewContent)
            }
        }
    }
}
