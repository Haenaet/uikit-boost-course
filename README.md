![UIKit_Boost_Course_Banner](https://github.com/Haenaet/uikit-boost-course/assets/26790710/046a479a-3f65-4462-89dd-3b4a0b035c48)

# UIKit Boost Course

UIKit Boost Course 학습 과정은 `.storyboard`파일을 생성하거나 사용하지 않고, Swift 문법을 사용하여 UIKit 프레임워크의 User Interface 요소를 사용해보는 것을 목표로 합니다.

## Overview

UIKit 프레임워크는 iOS, iPadOS, tvOS 앱의 핵심 인프라를 구축하는 데 사용할 수 있는 구성 요소를 포함하여 앱을 구축하기 위한 다양한 기능을 제공합니다. 이 프레임워크는 UI를 구현하기 위해 `Window`와 `UIView`, 사용자의 멀티 터치 및 기타 유형의 입력을 앱에 전달하는 이벤트 처리, 시스템 및 앱 간의 상호 작용을 관리하기 위한 주요 기능을 제공합니다.

대부분의 경우 UIKit 요소를 직접 그리거나 편집하기 쉬운 스토리보드와 함께 사용합니다. 이는 강력한 장점이지만 극복하기 어려운 단점도 존재합니다. 우선 스토리보드는 바이너리 형식으로 저장되기 때문에 버전관리 시스템(Git)에서 변경사항을 추적하거나 리뷰를 진행하기 어렵습니다. 그리고 프로젝트의 규모가 커질수록 스토리보드의 사용량도 증가할 수 밖에 없기 때문에 디버깅 및 빌드를 포함해서 파일을 불러오는 시간이 오래 걸릴 수 있습니다. 이는 결과적으로 앱 성능에도 영향을 줄 수 있습니다. 따라서 상황에 따른 적합하고 효율적인 선택을 할 필요가 있다는 것이 본 과정의 생성 배경이며, Programmatic한 적용 방식을 학습합니다. 

UIKit은 SwiftUI 프레임워크와 함께 사용할 수 있습니다. 예를 들어, SwiftUI에서 UIKit 앱의 일부를 구현하거나 두 프레임워크 간의 인터페이스 요소를 혼합하거나 UIKit 뷰와 뷰 컨트롤러를 SwiftUI 뷰 안에 배치할 수 있습니다. `UIViewControllerRepresentable`과 같은 강력한 기능을 사용해서 UIKit의 일부를 학습합니다.

## Curriculum

- 사전에 정해진 기한마다 1인 1개의 주제를 선택하고 학습합니다.
- 학습 기간은 모든 과정이 완료되는 동안 유지합니다.
- `UIViewControllerRepresentable`사용으로 **빠른 적용, 빠른 학습**을 지향합니다.
- Apple 공식 문서를 참고해서 스스로 학습한 내용에 대해 본인의 방식과 언어 흐름을 토대로 정리하고 공유합니다.
- 정리한 내용을 바탕으로 다른 사람에게 공유하는 시간을 가집니다. (15분 이내)

> **Important**
>
> 1. UIKit Boost Course의 학습내용은 기본적으로 [Apple Documentation](https://developer.apple.com/documentation/uikit)을 따릅니다.
>
> 2. <span style="color: #58A4B0">Beta</span>, <span style="color: #FA824C">Deprecated</span>의 내용은 다루지 않습니다.
>
> 3. macOS 내용은 다루지 않습니다.
>
> 4. Objective-C 관련 내용은 필요에 따라 적용하며, 그 외에는 다루지 않습니다.

### Chapter1: UIControl

- `UIControl`을 상속받은 요소를 학습합니다.

```Swift
  @MainActor
  class UIControl: UIView
```

| No. | Subject  | Original         | Presenter             | Status |
| :-- | :------- |:---------------- | :-------------------- | :----: |
| 1. | `UIButton` | [Link to page](https://developer.apple.com/documentation/uikit/uibutton) | 진미래 | ✅ |
| 2. | `UIColorWell` | [Link to page](https://developer.apple.com/documentation/uikit/uicolorwell) | 김유진 | ✅ |
| 3. | `UIDatePicker` | [Link to page](https://developer.apple.com/documentation/uikit/uidatepicker) | 이세령 | ✅ |
| 4. | `UIPageControl` | [Link to page](https://developer.apple.com/documentation/uikit/uipagecontrol) | 이세령 | 🚧 |
| 5. | `UISegementedControl` | [Link to page](https://developer.apple.com/documentation/uikit/uisegmentedcontrol) | 김유진 | 🚧 |
| 6. | `UIStepper` | [Link to page](https://developer.apple.com/documentation/uikit/uistepper) | 김유진 | 🚧 |
| 7. | `UISwitch` | [Link to page](https://developer.apple.com/documentation/uikit/uiswitch) | N/A | N/A |
| 8. | `UITextField` | [Link to page](https://developer.apple.com/documentation/uikit/uitextfield) |N/A | N/A |
| 9. | `UISearchTextField` | [Link to page](https://developer.apple.com/documentation/uikit/uisearchtextfield) | 진미래 | 🚧 |

### Chapter2: UIView

- `UIView`를 상속받은 요소를 학습합니다.

```Swift
  @MainActor
  class UIView: UIResponder
```

| No. | Subject  | Original         | Presenter             | Status |
| :-- | :------- |:---------------- | :-------------------- | :----: |
| 1. | `UIStackView` | [Link to page](https://developer.apple.com/documentation/uikit/uistackview) | N/A | N/A |
| 2. | `UIContentUnavailableView` | [Link to page](https://developer.apple.com/documentation/uikit/uicontentunavailableview) | N/A | N/A |
| 3. | `UICalendarView` | [Link to page](https://developer.apple.com/documentation/uikit/uicalendarview) | N/A | N/A |
| 4. | `UIActivityIndicatorView` | [Link to page](https://developer.apple.com/documentation/uikit/uiactivityindicatorview) | N/A | N/A |
| 5. | `UIImageView` | [Link to page](https://developer.apple.com/documentation/uikit/uiimageview) | N/A | N/A |
| 6. | `UITextView` | [Link to page](https://developer.apple.com/documentation/uikit/uitextview) | N/A | N/A |
| 7. | `UIProgressView` | [Link to page](https://developer.apple.com/documentation/uikit/uiprogressview) | N/A | N/A |
| 8. | `UIPickerView` | [Link to page](https://developer.apple.com/documentation/uikit/uipickerview) |N/A | N/A |
| 9. | `UIScrollView` | [Link to page](https://developer.apple.com/documentation/uikit/uiscrollview) | N/A | N/A |
