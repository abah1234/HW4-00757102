//
//  CharacterEditor.swift
//  HW4
//
//  Created by User16 on 2020/5/13.
//  Copyright © 2020 00657143. All rights reserved.
//

import SwiftUI

struct CharacterEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var charactersData = CharactersData()
    @State private var name = "艾黛爾賈特"
    var character = ["艾黛爾賈特", "修伯特", "多洛緹雅", "卡斯帕爾", "貝爾娜提塔", "佩托拉", "林哈爾特", "菲爾迪南特", "帝彌托利", "杜篤", "希爾凡", "亞修", "英谷莉特", "菲力克斯", "雅妮特", "梅爾賽德司", "庫羅德", "伊古納茲", "希爾妲", "拉斐爾", "洛廉茲", "莉絲提亞", "雷歐妮", "瑪莉安奴"]
    @State private var job = "弓手"
    var occupation = ["弓手", "要塞", "修士", "術師", "士兵", "騎士", "法師", "刺客"]
    @State private var useful = 3
    @State private var favourite = true
    @Binding var showAlert:Bool
    @State private var sameCharacter = false
    var editCharacter: Character?
    
    var body: some View {
        Form{
            VStack{
                Image("\(name)_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipped()
                Picker(selection: self.$name, label: Text("角色")){
                    ForEach(character, id: \.self){(index) in
                        Text(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Picker(selection: self.$job, label: Text("職業")){
                ForEach(occupation, id: \.self){(index) in
                    Text(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Stepper("實用分數\(useful) 分", value: $useful,in: 1...5)
            Toggle("我的最愛", isOn: $favourite)
        }
        .navigationBarTitle(editCharacter == nil ? "新增角色" : "編輯角色資料")
        .navigationBarItems(trailing: Button("儲存"){
            let character = Character(name: self.name, useful: self.useful, favourite: self.favourite, job: self.job)
          
            if let editCharacter = self.editCharacter{
        
                let index = self.charactersData.characters.firstIndex{
                    $0.id == editCharacter.id
                }!
                for nowCharacter in self.charactersData.characters.indices{
                    if nowCharacter != index {
                        if self.charactersData.characters[nowCharacter].name == character.name{
                            self.showAlert = true
                            self.sameCharacter = true
                            break
                        }
                    }
                }
                if self.sameCharacter == false{
                    self.charactersData.characters[index] = character
                }
            }else{
                for nowCharacter in self.charactersData.characters.indices{
                    if self.charactersData.characters[nowCharacter].name == character.name{
                        self.showAlert = true
                        self.sameCharacter = true
                        break
                    }
                }
                if self.sameCharacter == false{
                    self.charactersData.characters.insert(character, at: 0)
                }
            }
            self.presentationMode.wrappedValue.dismiss()
        })
        
        .onAppear{
            if let editCharacter = self.editCharacter{
                self.name = editCharacter.name
                self.useful = editCharacter.useful
                self.favourite = editCharacter.favourite
            }
        }
    }
}

struct CharacterEditor_Previews: PreviewProvider {
    static var previews: some View {
        CharacterEditor(charactersData: CharactersData(),showAlert: .constant(false))
    }
}
