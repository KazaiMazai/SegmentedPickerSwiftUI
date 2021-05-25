# SegmentedPicker

Custom segmented picker for SwiftUI

## Usage example

```swift

struct SegmentedPickerExample: View {
    let titles: [String]
    @State var selectedIndex: Int = 0

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 ?? 0 }),
            content: { item, isSelected in
                Text(item)
                    .foregroundColor(isSelected ? Color.black : Color.gray )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            },
            selection: {
                VStack(spacing: 0) {
                    Spacer()
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                }
            })
            .animation(.easeInOut(duration: 0.3))
    }
}

```

to get the following look:

![alt text](https://user-images.githubusercontent.com/2588468/119536850-2c3cf780-bd92-11eb-8908-56e1434dc14e.png)



or this guy with a capsule as selection view:


```swift

struct SegmentedPickerExample: View {
    let titles: [String]
    @State var selectedIndex: Int = 0

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 ?? 0 }),
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
            .animation(.easeInOut(duration: 0.3))
    }
}

```



![alt text](https://user-images.githubusercontent.com/2588468/119536944-41198b00-bd92-11eb-993e-a0c1a402c714.png)

