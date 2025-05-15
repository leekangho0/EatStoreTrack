# E.S.T

## 🍽️ E.S.T (Eat Store Track)

**E.S.T는 Eat Store Track의 약자로, 이스트 소프트 부트캠프의 이름에서 착안한 나만의 기록 앱입니다.**

 오늘 무엇을 먹었는지, 어떤 음료를 마셨는지, 어떤 영양제를 챙겼는지 기억나지 않으신가요?
 
 E.S.T는 음식, 음료, 영양제를 간편하게 기록하고 **태그별**로 정리할 수 있는 개인 건강/습관 기록 앱입니다.
 
 카테고리와 태그를 기반으로 내가 남긴 피드를 모아보고, **주간 월간 통계**로 과거의 나를 되돌아볼 수 있어요.
 
 
 > **"먹고, 저장하고, 이 기록을 계속 유지하자."** 
  — E.S.T

## 📱 Features
<p>
<img src = "https://github.com/user-attachments/assets/0752c0cc-c983-46b5-8e28-a041263480c4" width=33% hgap = 10>
<img src = "https://github.com/user-attachments/assets/21ce8424-410f-41f0-b735-13e805a2c1b9" width=33% hgap = 10>
<img src = "https://github.com/user-attachments/assets/fbfddc1f-51d7-4241-b8d6-908740b9d332" width=33% hgap = 10>
</p>

- **SwiftData**를 이용한 피드 CRUD
- **Query Macro**를 이용한 태그 및 콘텐츠 검색 구현
- Calendar와 DateFormatter 그리고 Query Macro를 활용한 데이터 가공

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
- SwiftData Modeling M:N 관계 정의하기
  - Relationship Attrubite를 이용하여 정의
- 필터링을 위한 기존 enum에 전체 타입 추가하기
  - 기존 enum Wrapper를 만드로 associatedValue를 이용하여 처리  
- Sheet에 Fade-In 처리하기
  - ZStack으로 복잡한 계층으로 되어있던 custom popup을 fullScreenCover를 이용하여 뷰계층을 단순화 시켜서 개선
  - 하지만 의도한 fade-in 애니메이션이 적용되지 않고, bottom-up animation만 작동하여, 기존 animation을 disable하고, onAppear 클로저를 이용한 fade in 애니메이션 구현
- 🪏 복잡한 쿼리를 이용한 필터링
  - 태그를 여러개 선택하고, 선택된 태그가 하나라도 속해있는 피드 필터링하기, predicate macro에서는 지원하지 않아서 실패 삽질 중
  - 처음 에상과 다르게 contains(where: ) 중첩한 closure는 lazy evaluation을 이용하여 전부 순회하지 않고 최적화되어있다. 하지만 해당 closure는 매크로 안에서 지원되지 않음
   
## 💻 팀원


|                          **이치훈**                          |                          **이동욱**                          |                          **이강호**                          |                          **최혜진**                          |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| [<img src="https://avatars.githubusercontent.com/logichoon-redo" height=150 width=150> <br/> @logichoon-redo](https://github.com/logichoon-redo) | [<img src="https://avatars.githubusercontent.com/drfranken99" height=150 width=150> <br/> @drfranken99](https://github.com/drfranken99) | [<img src="https://avatars.githubusercontent.com/ibcylon" height=150 width=150> <br/> @leekangho0](https://github.com/leekangho0) | [<img src="https://avatars.githubusercontent.com/lastduck2" height=150 width=150> <br/> @[lastduck2](https://github.com/lastduck2) |
