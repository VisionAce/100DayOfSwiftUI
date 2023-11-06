//
//  PhotosPickerView.swift
//  Instafilter
//
//  Created by 褚宣德 on 2023/11/2.
//


// MARK: -
// 不用coordinators的方法來選擇圖片
import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    @State private var avatarImage: UIImage?
    @State private var phtosPickerItem: PhotosPickerItem?
    
    @State private var images = [UIImage]()
    @State private var phtosPickerItems = [PhotosPickerItem]()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                PhotosPicker("Select Photos", selection: $phtosPickerItems, maxSelectionCount: 5, selectionBehavior: .ordered)
                Spacer()
                Button("RemoveAll") {
                    images.removeAll()
                }
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<images.count, id: \.self) { i in
                        Image(uiImage: images[i])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                    }
                }
            }
     
            Spacer()
       
            HStack(spacing: 20) {
                PhotosPicker(selection: $phtosPickerItem, matching: .images) {
                    Image(uiImage: avatarImage ?? UIImage(resource: .example))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)
                }
                
                VStack(alignment: .leading) {
                    Text("Jeff")
                        .font(.largeTitle.bold())
                    
                    Text("iOS Developer")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(30)
        .onChange(of: phtosPickerItem) {
            Task {
                if let phtosPickerItem,
                   let data = try? await phtosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        avatarImage = image
                    }
                }
                phtosPickerItem = nil
            }
            
        }
        .onChange(of: phtosPickerItems) {
            Task {
                for item in phtosPickerItems {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                }
                phtosPickerItems.removeAll()
            }
            
        }
    }
}

#Preview {
    PhotosPickerView()
}
