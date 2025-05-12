//
//  HomeView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct HomeView: View {

    @State var showPopup = false





    var body: some View {

        NavigationStack {
            ZStack {
                if showPopup {
                    Color.black.opacity(0.3)
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

                            NavigationLink(destination: StasticsView()) {
                                Image(systemName: "chart.pie")
                                    .font(.title)
                            }

                            NavigationLink(destination: TagManageView()) {
                                Image(systemName: "tag")
                                    .font(.title)
                            }

                            NavigationLink(destination: SearchView()) {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                            }


                        }
                        .padding(.horizontal, 40)



                        ForEach(sampleFeeds.sorted(by: { $0.create_date > $1.create_date })) { feed in
                            VStack(spacing: 2) {

                                NavigationLink(destination: FeedWriteView()) {
                                    Image(systemName: "square.and.pencil")
                                }

                                HStack {
                                    if let category = sampleCategories.first(where: { $0.id == feed.category_id }) {
                                        Text("\(category.emoji)")
                                            .font(.largeTitle)

                                        VStack {
                                            Text("\(feed.create_date)")
                                                .font(.caption)

                                            HStack {
                                                ForEach(feed.tags) { tag in
                                                    Text("\(tag.emoji)")
                                                }
                                            }

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
//                                .padding()
                            }
                            .padding(10)


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



