//
//  TextFieldView.swift
//  StateAndBinding
//
//  Created by 胡文博 on 2023/06/28.
//

import SwiftUI
// TextField的prompt参数,是作为占位符显示
// 但放在Form中之后,在各端效果不一样,ios端的title参数内容不显示,Mac端title参数会在TextField前面显示
//SecureField("请输入秘法", text: $name)

struct TextFieldView: View {
    enum Field: Hashable {
        case name, phone, address
    }
    @State private var name = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var addressLabelIndex = 0
    @State private var showAlert = false
    
    @FocusState private var isFocused: Field?
    
    let addressLabels = ["家", "公司", "学校"]
    
    var confirmMsg: String{
        """
        收货人:\(name)
        手机号:\(phone)
        地址:\(address)
        标签:\(addressLabels[addressLabelIndex])
        """
    }
    
    var invalidInput: Bool{
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    HStack {
                        Text("收件人")
                        TextField("请输入收货人姓名", text: $name)
                            .focused($isFocused, equals: .name)
                    }
                    HStack{
                        Text("手机号:")
                        TextField("请输入收货人手机号", text: $phone)
                            .focused($isFocused, equals: .phone)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("地址")
                        TextField("请输入收货人地址", text: $address)
                            .focused($isFocused, equals: .address)
                    }
                }
                Section {
                    Picker("标签", selection: $addressLabelIndex) {
                        ForEach(addressLabels.indices, id: \.self){ index in
                            Text(addressLabels[index])
                        }
                    }
                } header: {
                    Text("标签")
                }
                .pickerStyle(.segmented)
                Section {
                    Button("填好了") {
                        if name.isEmpty{
                            isFocused = .name
                        } else if phone.isEmpty {
                            isFocused = .phone
                        } else if address.isEmpty {
                            isFocused = .address
                        } else {
                            isFocused = nil
                            showAlert = true
                            print("输入没问题,可以提交")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
    //                .disabled(invalidInput)
                }
            }
            .navigationTitle("新增收货地址")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("完成"){
                        isFocused = nil
                    }
                }
            }
        }
        .alert("确认地址", isPresented: $showAlert) {
            Button("确认了", role: .cancel) {
            }
        } message: {
            Text(confirmMsg)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isFocused = .name
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
