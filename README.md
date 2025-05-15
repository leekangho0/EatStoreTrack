# E.S.T

## 🍽️ E.S.T (Eat Store Track)

**E.S.T는 Eat Store Track의 약자로, 이스트 소프트 부트캠프의 이름에서 착안한 나만의 기록 앱입니다.**
 오늘 무엇을 먹었는지, 어떤 음료를 마셨는지, 어떤 영양제를 챙겼는지 기억나지 않으신가요?
 E.S.T는 음식, 음료, 영양제를 간편하게 기록하고 태그별로 정리할 수 있는 개인 건강/습관 기록 앱입니다.
 카테고리와 태그를 기반으로 내가 남긴 피드를 모아보고, **주간 월간 통계**로 과거의 나를 되돌아볼 수 있어요.
 **"먹고, 저장하고, 이 기록을 계속 유지하자."** — 이것이 E.S.T의 철학입니다.

## 📱 Features

|                             피드                             |                             검색                             |                            보고서                            |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="https://media.discordapp.net/attachments/1356527487231983637/1372595486074339440/IMG_5975.PNG?ex=682758a9&is=68260729&hm=fac3fd5c642ebf7beb87e43a1b3ce599850e7223d55ae6f9dce36cd7f57cbbe0&=&format=webp&quality=lossless&width=424&height=918" width = 40%> | <img src="https://media.discordapp.net/attachments/1356527487231983637/1372600186341429349/IMG_7A9D9E5EF2B4-1.jpeg?ex=68275d0a&is=68260b8a&hm=904ecd55f1e7f84e777a87774d03bcb84dadb05fc6c1e4e65bf8c2d04d87edb4&=&format=webp&width=376&height=814" width=40%> | <img src="https://media.discordapp.net/attachments/1356527487231983637/1372600186764918895/IMG_27251FB948AE-1.jpeg?ex=68275d0a&is=68260b8a&hm=6e08aea0eac6cd3aa7efad04393dc210f78e848219f4c9f046685621714a1869&=&format=webp&width=376&height=814" width=40%> |
|                 SwiftData를 이용한 피드 CRUD                 |        Query Macro를 이용한 태그 및 콘텐츠 검색 구현         | Calendar와 DateFormatter 그리고 Query Macro를 활용한 데이터 가공 |

##  🧱 Tech Stack

- **SwiftUI**
  - @State, @Binding 이용한 상태 관리
  - @ViewBuilder 이용한 컴포넌트 개발
  - 다크모드 지원
  - DynamicType Font 지원
- **SwiftData**
  - SwiftData를 이용하여 M:N 모델링
  - Query를 이용하여 Fetch 및 CRUD
- **멀티플랫폼 지원**
  - 아이폰 / 아이패드 

## 🤝 **협업**

- **Git** 이용 소스코드 버전관리
- 피처 브랜치 작성 후, **PR**을 통해 머지
- 노션 **보드**를 이용한 프로젝트 관리
- **스크럼**을 통한 상황 공유
  - 9시, 13시, 18시 짧은 스크럼을 통해 오늘 할 일 공유, 진척도, 내일 할일 공유


## 📂 Structure

```swift
├── App
│   └── EatingAppApp.swift
├── Data
│   └── Model
│       ├── CategoryModel.swift
│       ├── FeedModel.swift
│       ├── Rank.swift
│       ├── RelationModel.swift
│       └── TagModel.swift
├── Features
│   ├── Component
│   │   ├── FadeOutSheetView.swift
│   │   ├── FeedItem.swift
│   │   ├── FeedListView.swift
│   │   ├── RankRow.swift
│   │   ├── YearMonthPicker.swift
│   │   └── YearMonthPickerView.swift
│   ├── Feed
│   │   └── FeedWriteView.swift
│   ├── HomeView.swift
│   ├── Search
│   │   ├── SearchResultView.swift
│   │   └── SearchView.swift
│   ├── Splash
│   │   ├── FirstView.swift
│   │   └── SplashView.swift
│   ├── Statistics
│   │   └── StasticsView.swift
│   └── Tag
│       ├── TagCreateView.swift
│       └── TagManageView.swift
├── PreviewHelper
│   ├── Preview+ModelContainer.swift
│   ├── PreviewContainer.swift
│   ├── SampleData
│   │   ├── sampleData.swift
│   │   ├── SampleData+Categories.swift
│   │   ├── SampleData+Feeds.swift
│   │   └── SampleData+Tags.swift
│   └── SampleView.swift
├── Resource
│   └── Assets.xcassets
└── Util
    ├── Date+.swift
    ├── DesignMetric.swift
    └── Modifier
        └── PaddingBackroundStyle.swift
```

## 🏹 Trouble shooting

## 💻 팀원


|                          **이치훈**                          |                          **이동욱**                          |                          **이강호**                          |                          **최혜진**                          |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| [<img src="https://avatars.githubusercontent.com/logichoon-redo" height=150 width=150> <br/> @logichoon-redo](https://github.com/logichoon-redo) | [<img src="https://avatars.githubusercontent.com/drfranken99" height=150 width=150> <br/> @drfranken99](https://github.com/drfranken99) | [<img src="https://avatars.githubusercontent.com/ibcylon" height=150 width=150> <br/> @leekangho0](https://github.com/leekangho0) | [<img src="https://avatars.githubusercontent.com/lastduck2" height=150 width=150> <br/> @[lastduck2](https://github.com/lastduck2) |
