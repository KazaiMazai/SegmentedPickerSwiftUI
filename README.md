# Swifty Segmented Picker

Custom segmented picker for SwiftUI. 

## Installation

### Swift Package Manager.

SwiftySegmentedPicker is available through Swift Package Manager. 
To install it, in Xcode 11.0 or later select File > Swift Packages > Add Package Dependency... 

and add SwiftySegmentedPicker repository URL:

```
https://github.com/KazaiMazai/SwiftySegmentedPicker.git
```


## Underline Selection Usage Example

```swift

struct SegmentedPickerExample: View {
    let titles: [String]
    @State var selectedIndex: Int?

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 }),
            selectionAlignment: .bottom,
            content: { item, isSelected in
                Text(item)
                    .foregroundColor(isSelected ? Color.black : Color.gray )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            },
            selection: {
                VStack(spacing: 0) {
                    Spacer()
                    Color.black.frame(height: 1)
                }
            })
            .onAppear {
                selectedIndex = 0
            }
            .animation(.easeInOut(duration: 0.3))
    }
}

```



<p align="left">
  <img src="https://user-images.githubusercontent.com/2588468/119536850-2c3cf780-bd92-11eb-8908-56e1434dc14e.png" width="250" title="hover text">
</p>


## Capsule Selection Usage Example


```swift

struct SegmentedPickerExample: View {
    let titles: [String]
    @State var selectedIndex: Int?

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 }),
            content: { item, isSelected in
                Text(item)
                    .foregroundColor(isSelected ? Color.white : Color.gray )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            },
            selection: {
                Capsule()
                    .fill(Color.gray)
            })
            .onAppear {
                selectedIndex = 0
            }
            .animation(.easeInOut(duration: 0.3))
    }
}

```

<p align="left">
  <img src="https://user-images.githubusercontent.com/2588468/119536944-41198b00-bd92-11eb-993e-a0c1a402c714.png" width="300" title="hover text">
</p>

## Licensing

SwiftySegmentedPicker is licensed under MIT license.
