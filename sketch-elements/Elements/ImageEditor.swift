////
////  ImageEditor.swift
////  sketch-elements
////
////  Created by Filip Krayem on 08.06.2021.
////  Copyright © 2021 Filip Molcik. All rights reserved.
////
//
//import SwiftUI
//import BrightroomUI
//import BrightroomEngine
//import URLImage
//struct ImageEditor: View {
//    @State private var image: SwiftUI.Image?
//
//    @State private var sharedStack = Mocks.makeEditingStack(image: Mocks.imageHorizontal())
//    @State private var fullScreenView: FullscreenIdentifiableView?
//
//    @State private var stackForHorizontal: EditingStack = Mocks.makeEditingStack(image: UIImage(systemName: Constant.icon.bed)!)
//    @State private var stackForVertical: EditingStack = Mocks.makeEditingStack(image: UIImage(systemName: Constant.icon.camera)!)
//    @State private var stackForSquare: EditingStack = Mocks.makeEditingStack(image: UIImage(systemName: Constant.icon.bookmark)!)
//    @State private var stackForNasa: EditingStack = Mocks.makeEditingStack(
//        fileURL: photographyData[0].urls.regular
//    )
//    @State private var stackForSmall: EditingStack = Mocks.makeEditingStack(image: UIImage(systemName: Constant.icon.chevronDown)!)
//
//    var body: some View {
//      NavigationView {
//        VStack {
//          Group {
//            if let image = image {
//              image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            } else {
//              Color.gray
//            }
//          }
//          .frame(width: 120, height: 120, alignment: .center)
//          Form {
//            NavigationLink("Isolated", destination: IsolatedEditinView())
//
//            Button("Component: Crop") {
//              fullScreenView = .init { DemoCropView(editingStack: sharedStack) }
//            }
//
//            Section(content: {
//              Button("Crop: Horizontal") {
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stackForHorizontal, onCompleted: {
//                    self.image = try! stackForHorizontal.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Vertical") {
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stackForVertical, onCompleted: {
//                    self.image = try! stackForVertical.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Square") {
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stackForSquare, onCompleted: {
//                    self.image = try! stackForSquare.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Nasa") {
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stackForNasa, onCompleted: {
//                    self.image = try! stackForNasa.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Super small") {
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stackForSmall, onCompleted: {
//                    self.image = try! stackForSmall.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Remote") {
//                let stack = EditingStack(
//                  imageProvider: .init(
//                    editableRemoteURL: URL(string: "https://images.unsplash.com/photo-1604456930969-37f67bcd6e1e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1")!
//                  )
//                )
//
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stack, onCompleted: {
//                    self.image = try! stack.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//
//              Button("Crop: Remote - preview") {
//                let stack = EditingStack(
//                  imageProvider: .init(
//                    editableRemoteURL: URL(string: "https://images.unsplash.com/photo-1597522781074-9a05ab90638e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D")!
//                  )
//                )
//
//                fullScreenView = .init {
//                  SwiftUIPhotosCropView(editingStack: stack, onCompleted: {
//                    self.image = try! stack.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  })
//                }
//              }
//            })
//
//            Section(content: {
//              Button("PixelEditor Square") {
//                let stack = EditingStack.init(
//                  imageProvider: .init(image: UIImage(systemName: Constant.icon.chevronUp)!),
//                  cropModifier: .init { _, crop, completion in
//                    var new = crop
//                    new.updateCropExtent(toFitAspectRatio: .square)
//                    completion(new)
//                  }
//                )
//                fullScreenView = .init {
//                  PixelEditWrapper(editingStack: stack) {
//                    self.image = try! stackForHorizontal.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  }
//                }
//              }
//
//              Button("PixelEditor") {
//                let stack = EditingStack.init(
//                  imageProvider: .init(image: UIImage(systemName: Constant.icon.chevronLeft)!)
//                )
//                fullScreenView = .init {
//                  PixelEditWrapper(editingStack: stack) {
//                    self.image = try! stackForHorizontal.makeRenderer().render().swiftUIImage
//                    self.fullScreenView = nil
//                  }
//                }
//              }
//            })
//          }
//        }
//        .navigationTitle("Pixel")
//        .fullScreenCover(
//          item: $fullScreenView,
//          onDismiss: {}, content: {
//            $0
//          }
//        )
//      }
//      .onAppear(perform: {
//        ColorCubeStorage.loadToDefault()
//      })
//    }
//  }
//
//  import BrightroomUI
//  import BrightroomEngine
//
//  struct PixelEditWrapper: UIViewControllerRepresentable {
//    typealias UIViewControllerType = UINavigationController
//
//    private let editingStack: EditingStack
//    private let onCompleted: () -> Void
//
//    init(editingStack: EditingStack, onCompleted: @escaping () -> Void) {
//      self.editingStack = editingStack
//      self.onCompleted = onCompleted
//      editingStack.start()
//    }
//
//    func makeUIViewController(context: Context) -> UINavigationController {
//      let cropViewController = ClassicImageEditViewController(editingStack: editingStack)
//      cropViewController.handlers.didEndEditing = { _, _ in
//        onCompleted()
//      }
//      return UINavigationController(rootViewController: cropViewController)
//    }
//
//    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
//  }
//
//  var _loaded = false
//  extension ColorCubeStorage {
//    static func loadToDefault() {
//      guard _loaded == false else {
//        return
//      }
//      _loaded = true
//
//      do {
//        let loader = ColorCubeLoader(bundle: .main)
//        self.default.filters = try loader.load()
//
//      } catch {
//        assertionFailure("\(error)")
//      }
//    }
//}
//
//struct ImageEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageEditor()
//    }
//}
//
//enum Mocks {
//  
//  static func imageVertical() -> UIImage {
//    UIImage(systemName: Constant.icon.doc)!
//  }
//  
//  static func imageHorizontal() -> UIImage {
//    UIImage(systemName: Constant.icon.doc)!
//  }
//  
//  static func imageSquare() -> UIImage {
//    UIImage(systemName: Constant.icon.doc)!
//  }
//  
//  static func imageSuperSmall() -> UIImage {
//    UIImage(systemName: Constant.icon.doc)!
//  }
//  
//  static func makeEditingStack(image: UIImage) -> EditingStack {
//    .init(
//      imageProvider: .init(image: image)
//    )
//  }
//    
//  static func makeEditingStack(fileURL: URL) -> EditingStack {
//    .init(
//        imageProvider: try! .init(image: UIImage(data: try! Data(contentsOf: fileURL))!)
//    )
//  }
//  
//}
//
//
//struct FullscreenIdentifiableView: View, Identifiable {
//  @Environment(\.presentationMode) var presentationMode
//  
//  let id = UUID()
//  private let content: AnyView
//  
//  init<Content: View>(content: () -> Content) {
//    self.content = .init(content())
//  }
//  
//  var body: some View {
//    VStack {
//      content
//      Button("Dismiss") {
//        presentationMode.wrappedValue.dismiss()
//      }
//      .padding(16)
//    }
//    .clipped()
//  }
//}
//
//
//struct IsolatedEditinView: View {
//  @StateObject var editingStack = Mocks.makeEditingStack(image: Mocks.imageHorizontal())
////  @StateObject var editingStack = Mocks.makeEditingStack(fileURL:
////    Bundle.main.path(
////      forResource: "gaku",
////      ofType: "jpeg"
////    ).map {
////      URL(fileURLWithPath: $0)
////    }!)
//  @State private var fullScreenView: FullscreenIdentifiableView?
//
//  var body: some View {
//    Form {
//      Button("Crop") {
//        fullScreenView = .init { SwiftUIPhotosCropView(
//          editingStack: editingStack,
//          onCompleted: {}
//        ) }
//      }
//
//      Button("Custom Crop") {
//        fullScreenView = .init { DemoCropView(editingStack: editingStack) }
//      }
//
//      Button("Blur Mask") {
//        fullScreenView = .init { MaskingViewWrapper(editingStack: editingStack) }
//      }
//    }
//    .navigationTitle("Isolated-Editing")
//    .fullScreenCover(
//      item: $fullScreenView,
//      onDismiss: {}, content: {
//        $0
//      }
//    )
//  }
//}
//
//
//struct DemoCropView: View {
//  let editingStack: EditingStack
//
//  var body: some View {
//    VStack {
//      ZStack {
//        Color.black
//          .ignoresSafeArea()
//        
//        SwiftUICropView(
//          editingStack: editingStack,
//          cropInsideOverlay: .init(
//            /**
//             Here is how to create a customized overlay view.
//             */
//            VStack {
//              Circle()
//                .foregroundColor(.white)
//                .frame(width: 50, height: 50, alignment: .center)
//            })
//        )
//        .clipped()
//      }
//      Button("Done") {
//        let image = try! editingStack.makeRenderer().render().swiftUIImage
//        print(image)
//      }
//    }
//    .onAppear {
//      editingStack.start()
//    }
//  }
//}
//
//struct MaskingViewWrapper: UIViewRepresentable {
//  
//  typealias UIViewType = BlurryMaskingView
//  
//  private let editingStack: EditingStack
//  
//  init(editingStack: EditingStack) {
//    self.editingStack = editingStack
//  }
//
//  func makeUIView(context: Context) -> BlurryMaskingView {
//    let view = UIViewType.init(editingStack: editingStack)
//    return view
//  }
//  
//  func updateUIView(_ uiView: BlurryMaskingView, context: Context) {
//
//  }
//    
//}
