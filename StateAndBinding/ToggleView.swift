//
//  ToggleView.swift
//  StateAndBinding
//
//  Created by 胡文博 on 2023/06/28.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn = false
    var body: some View {
        Toggle("深色模式", isOn: $isOn).padding()
            .onChange(of: isOn) { isOn in
                print(isOn)
            }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
