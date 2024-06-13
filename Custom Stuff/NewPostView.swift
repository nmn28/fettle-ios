//
//  NewPostView.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/10/24.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var headlineText = ""
    var body: some View {
        VStack {
            HStack {
                IconButton(iconName: "xmark", action: {
                    presentationMode.wrappedValue.dismiss()
                })
                Spacer()
    //            IconButton(iconName: "rays", action: {
    //                // action for rays
    //            })
                Text("New Post")
                Spacer()
                IconButton(iconName: "paperplane", action: {
//                    postIdea()
                })
            }
            .padding(.horizontal)
            CustomDivider()
            ScrollView {
                
                VStack(alignment: .leading) {
                    HStack {
                        IconButton(iconName: "text.line.first.and.arrowtriangle.forward", action: {
                            // action for paperplane
                        })
                        TextField("Headline", text: $headlineText)
                    }
//                    HStack {
//                        IconButton(iconName: "calendar", action: {
//                            // action for paperplane
//                        })
//                        TextField("by When?", text: $headlineText)
//                    }
    //                HStack {
    //                    IconButton(iconName: "storefront", action: {
    //                        // action for paperplane
    //                    })
    //                    TextField("Add to a Category? (optional)", text: $headlineText)
    //                }
    //                HStack {
    //                    IconButton(iconName: "person.3", action: {
    //                        // action for paperplane
    //                    })
    //                    TextField("Add to a Conference? (optional)", text: $headlineText)
    //                }
                    HStack {
                        IconButton(iconName: "pencil", action: {
                            // action for paperplane
                        })
                        TextField("Body", text: $headlineText)
//                            .focused($focusPostEditor)
                    }
//                    if let postImage = selectedImage {
//                        Image(uiImage: postImage)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(maxWidth: .infinity)
//                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            CustomDivider()
            HStack(spacing: 20) {
                
                Button(action: {
                    
                }) {
                    Image(systemName: "camera")
                }
                
                Button(action: {
//                    showingImagePicker = true
                }) {
                    Image(systemName: "photo")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "folder")
                }
                
                Button(action: {
                    
                }) {
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "link")
                }
                
                
                Spacer()
                
                Divider().frame(height: 36).padding(.vertical, 4)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NewPostView()
}
