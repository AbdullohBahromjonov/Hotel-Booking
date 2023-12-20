//
//  FlexibleView.swift
//  Test_Project
//
//  Created by Abdulloh on 16/12/23.
//

import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat = UIScreen.main.bounds.size.width
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
          let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

          if remainingWidth - elementSize.width >= 0 {
            rows[currentRow].append(element)
          } else {
            // start a new row
            currentRow = currentRow + 1
            rows.append([element])
            remainingWidth = availableWidth
          }

          remainingWidth = remainingWidth - elementSize.width
        }

        return rows
      }
}


#Preview {
    FlexibleView(
        data: [
            "Бесплатный Wifi на всей территории отеля",
            "1 км до пляжа",
            "Бесплатный фитнес-клуб",
            "20 км до аэропорта"
        ],
        spacing: 5,
        alignment: .leading
    ) { item in
        Text(item)
            .foregroundColor(Color("Text secondary"))
            .font(.system(size: 16))
            .padding(5)
            .background(Color("Features color"))
            .cornerRadius(5)
    }
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
