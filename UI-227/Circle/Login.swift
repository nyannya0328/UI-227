//
//  Login.swift
//  UI-227
//
//  Created by にゃんにゃん丸 on 2021/06/06.
//

import SwiftUI

struct Login: View {
    
    @State var txt = ""
    @State var pass = ""
    var body: some View {
        VStack{
            
            
            
            
            Text("SIGN IN")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
          
            
            
            
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("User Name")
                
                TextField("Enter", text: $txt)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.red)
                
                Divider()
                    .background(Color.primary)
                
                
                    
            })
            .padding(.top,5)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Password")
                
               SecureField("1234", text: $pass)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.blue)
                
                Divider()
                    .background(Color.primary)
                    
                    
            })
            .padding(.top,20)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("For Got Password?")
                   
            })
            .frame(maxWidth: .infinity,alignment: .trailing)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("dark"))
                    .clipShape(Circle())
                
            })
            .frame(maxWidth: .infinity,alignment: .leading)
            
           
            
        }
        .padding()
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
