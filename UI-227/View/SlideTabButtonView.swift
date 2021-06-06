//
//  SlideTabButtonView.swift
//  UI-227
//
//  Created by にゃんにゃん丸 on 2021/06/06.
//

import SwiftUI

struct SlideTabButtonView: View {
   
    @Binding var selected : String
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .padding(.top,50)
            
           
                Text("Tokyo Tower")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                    
                  
                        
                      
                        
                        
                   
                })
                
                
                VStack(alignment: .leading, spacing: 15, content: {
                    TabButon(title: "Home", image: "house.fill", selceted: $selected,animation: animation)
                    
                    TabButon(title: "Settings", image: "gear", selceted: $selected,animation: animation)
                    
                    TabButon(title: "PC", image: "desktopcomputer", selceted: $selected,animation: animation)
                    
                    
                    TabButon(title: "Write Down", image: "pencil", selceted: $selected,animation: animation)
                    
                    
                    TabButon(title: "Apple", image: "applelogo", selceted: $selected,animation: animation)
                })
                
                .padding(.leading,-15)
            
            Spacer(minLength: 50)
            
            
            
                
                
            VStack(alignment: .leading, spacing: 15, content: {
                TabButon(title: "Approve", image: "person.crop.square.fill.and.at.rectangle", selceted: .constant(""),animation: animation)
                    .padding(.leading,-15)
                
                Text("Version 1.2.3")
                    .font(.footnote)
                    .foregroundColor(.primary)
                    .opacity(0.7)
                    .offset(x: 16)
            })
           
                
        
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SlideTabButtonView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct TabButon : View {
    var title : String
    var image : String
    @Binding var selceted : String
    
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            withAnimation(.spring()){
                
                selceted = title
            }
            
        }, label: {
            HStack(spacing:15){
                
                Image(systemName: image)
                    .font(.system(size: 20, weight: .heavy))
                    .frame(width: 30)
                
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.light)
                
                
                
                
                
                
                
                
            }
            .foregroundColor(selceted == title ? .primary : .white)
            .frame(maxWidth: UIScreen.main.bounds.width - 180,alignment: .leading)
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(
            
                ZStack{
                    
                    if selceted == title{
                        
                        
                        Color.white
                            .opacity(selceted == title ? 1 : 0)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .clipShape(CustomShape(corner: [.topLeft,.bottomLeft], radi:20))
                        
                    }
                    
                }
            
            )
        })
        
    }
    
}

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radi : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}
