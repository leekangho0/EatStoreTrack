//
//  HomeView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct HomeView: View {

    @State var showPopup = false


    let sampleCategories: [Category] = [
        Category(
            id: 1,
            name: "먹을거",
            emoji: "🍽️",
        ),Category(
            id: 2,
            name: "마실거",
            emoji: "🍹",
        ),Category(
            id: 3,
            name: "영양제",
            emoji: "💊",
        ),

    ]


    let sampleFeeds: [Feed] = [
        Feed(
            id: 1,
            content: "아 맵다 매워",
            category_id: 1,
            use_yn: "Y",
            create_date: "2025-05-09 12:12:12",
            update_date: "2025-05-09 12:12:12",
        ), Feed(
            id: 2,
            content: "아 달다 달아",
            category_id: 1,
            use_yn: "Y",
            create_date: "2025-05-10 12:12:12",
            update_date: "2025-05-10 12:12:12",
        ), Feed(
            id: 3,
            content: "아 시원 시원",
            category_id: 2,
            use_yn: "Y",
            create_date: "2025-05-10 12:13:12",
            update_date: "2025-05-10 12:13:12",
        ), Feed(
            id: 4,
            content: "아 쓰다 쓰다",
            category_id: 3,
            use_yn: "Y",
            create_date: "2025-05-11 12:13:12",
            update_date: "2025-05-11 12:13:12",
        )
    ]


    let sampleTags: [Tag] = [
        Tag(id: 1, name: "불닭뽀끔면", emoji: "🍝", category_id: 1, use_yn: "Y"),
        Tag(id: 2, name: "피자", emoji: "🍕", category_id: 1, use_yn: "Y"),
        Tag(id: 3, name: "사탕", emoji: "🍭", category_id: 1, use_yn: "Y"),
        Tag(id: 4, name: "아아", emoji: "🥤", category_id: 2, use_yn: "Y"),
        Tag(id: 5, name: "녹용", emoji: "☠️", category_id: 3, use_yn: "Y"),
        Tag(id: 6, name: "김치찌개", emoji: "🥘", category_id: 1, use_yn: "Y"),
        Tag(id: 7, name: "초밥", emoji: "🍣", category_id: 1, use_yn: "Y"),
        Tag(id: 8, name: "햄버거", emoji: "🍔", category_id: 1, use_yn: "Y"),
        Tag(id: 9, name: "떡볶이", emoji: "🌶️", category_id: 1, use_yn: "Y"),
        Tag(id: 10, name: "치킨", emoji: "🍗", category_id: 1, use_yn: "Y"),
        Tag(id: 11, name: "라면", emoji: "🍜", category_id: 1, use_yn: "Y"),
        Tag(id: 12, name: "스테이크", emoji: "🥩", category_id: 1, use_yn: "Y"),
        Tag(id: 13, name: "샐러드", emoji: "🥗", category_id: 1, use_yn: "Y"),
        Tag(id: 14, name: "콜라", emoji: "🥤", category_id: 2, use_yn: "Y"),
        Tag(id: 15, name: "에스프레소", emoji: "☕", category_id: 2, use_yn: "Y"),
        Tag(id: 16, name: "보리차", emoji: "🍵", category_id: 2, use_yn: "Y"),
        Tag(id: 17, name: "홍삼", emoji: "🧧", category_id: 3, use_yn: "Y"),
        Tag(id: 18, name: "비타민D", emoji: "🌞", category_id: 3, use_yn: "Y"),
        Tag(id: 19, name: "유산균", emoji: "🦠", category_id: 3, use_yn: "Y")
    ]






    var body: some View {

        NavigationStack {
            ZStack {
                if showPopup {
                    Color.black.opacity(0.001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showPopup = false
                            }
                        }
                }
                ScrollView {
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()

                            NavigationLink(destination: SearchView()) {

                                Image(systemName: "magnifyingglass")
                                    .font(.title)

                            }
                        }
                        .padding(.horizontal, 40)



                        ForEach(sampleFeeds) { feed in
                            HStack {
                                if let category = sampleCategories.first(where: { $0.id == feed.category_id }) {
                                    Text("\(category.emoji)")
                                        .font(.largeTitle)

                                    VStack {
                                        HStack {
                                            Text("") // 여기에 해당하는 태그의 이모지 표시. 여러개.
                                        }

                                        Text("\(feed.content)")
                                            .font(.caption)
                                    }
                                }

                            }
                            .padding(30)
                            .background(Color.green.opacity(0.3))
                            .padding()

                        }
                    }
                }


                VStack {
                    Spacer()

                    if showPopup {
                        HStack(spacing: 30) {
                            ForEach(sampleCategories, id: \.id) { category in
                                NavigationLink(destination: FeedWriteView()) {
                                    VStack(spacing: 4) {
                                        Text(category.emoji).font(.largeTitle)
                                        Text(category.name)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    withAnimation {
                                        showPopup = false
                                    }
                                })
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeOut(duration: 0.3), value: showPopup)
                    }

                    Button {
                        withAnimation {
                            showPopup.toggle()
                        }
                    } label: {
                        Text("새글작성")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding(.horizontal)
                    }
                }
            }
        }

    }
}

#Preview {
    HomeView()
}




struct Feed: Identifiable {
    let id: Int
    let content: String
    let category_id: Int
    let use_yn: String
    let create_date: String
    let update_date: String
}

struct Category: Identifiable {
    let id: Int
    let name: String
    let emoji: String
}

struct Tag: Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let category_id: Int
    let use_yn: String
}

struct Relation: Identifiable {
    let id: Int
    let feed_id: Int
    let tag_id: Int
    let use_yn: String
    let create_date: String
    let update_date: String
}
