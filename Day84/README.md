# Day 84: Projects 16: HotProspects

Follow along at 
- [Day 84 – Project 16, part six][1]

# 📒 Field Notes

It focuses on several specific topics:

- Saving and loading data with UserDefaults
- Adding a context menu to an image
- Posting notifications to the lock screen
 
 
## Saving and loading data with UserDefaults

Fix two other problems:
1. We’ve had to hard-code the key name “SavedData” in two places, which again might cause problems in the future if the name changes or needs to be used in more places.
2. Having to call **save()** inside **ProspectsView** isn’t good design, partly because our view really shouldn’t know about the internal workings of its model, but also because if we have other views working with the data then we might forget to call **save()** there.

- **Prospects** initializer able to load data from **UserDefaults**
- Adding a **save()** method
- Create an **add()** method


## Adding a context menu to an image

- In terms of saving the image, we can use the same ImageSaver class we used back in project 13 (Instafilter)

- context menu button can use the cached code

- To add this change, first add a new @State property that will store the code we generate:

      @State private var qrCode = UIImage()

>**Problem**: we modified our view’s state during a view update, which causes undefined behavior. “Undefined behavior” is a fancy way of saying “this could behave in any number of weird ways, so don’t do it.”

This is A Very Bad Idea, which is why Xcode is flagging up a large warning. Think about it: if drawing the QR code changes our **@State** cache property, that will cause body to loaded again, which will cause the QR code to be drawn again, which will change our cache property again, and so on – it’s really messy.

>**Sloved**:
The smart thing to do here is tell our image to render directly from the cached qrImage property, then call generateQRCode() when the view appears and whenever either name or email address changes.

1. add this new method to **MeView**

       func updateCode() {
          qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
       }

2. revert the **qrCode = UIImage(cgImage: cgimg)** line in **generateQRCode()**, just return the **UIImage** directly
3. change the QR code image to this:

       Image(uiImage: qrCode)
4. add these new modifiers after **navigationTitle()**:

       .onAppear(perform: updateCode)
       .onChange(of: name) { _ in updateCode() }
       .onChange(of: emailAddress) { _ in updateCode() }
      
- Select “Privacy - Photo Library Additions Usage Description” for the key name.
Enter “We want to save your QR code.” as the value.


## Posting notifications to the lock screen

- import UserNotifications

[func addNotification(for prospect: Prospect)][2] 
- center
- addRequest
  - content
    - title
    - subtitle
    - sound 
  - dateComponents
  - trigger
  - request
- **getNotificationSettings()** and **requestAuthorization()**

[1]: https://www.hackingwithswift.com/100/swiftui/84
[2]: https://github.com/VisionAce/100DaysOfSwiftUI/blob/b79babd1df58fb15e3621e2f1973a2d15c47b789/Day84/ProspectsView.swift#L110C1-L144C6
