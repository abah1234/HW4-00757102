//
//  CharacterRow.swift
//  HW4
//
//

import SwiftUI

struct CharacterRow: View {
    var character: Character
    var body: some View {
        HStack{
            Image(character.name)
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width:50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
            VStack(alignment: .leading){
                Text(character.name)
                Text(character.job)
            }
            Spacer()
            Text("\(character.useful) 分")
            Image(systemName: character.favourite ? "heart.fill" : "heart")
        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(name: "艾黛爾賈特", useful: 4, favourite: true, job: "弓箭手"))
    }
}
