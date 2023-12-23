//
//  Extension.swift
//  Test_Project
//
//  Created by Abdulloh on 21/12/23.
//

import SwiftUI

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
    
    func blockBackground(alignment: Alignment) -> some View {
        modifier(BlockBackground(alignment: alignment))
    }
    
    func title() -> some View {
        modifier(TitleText())
    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private struct BlockBackground: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}

private struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .medium))
    }
}
