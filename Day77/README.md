# Day 77: Milestone: Projects 13-15

Follow along at 
- [Day 77 – Milestone: Projects 13-15][1]

# 📒 Field Notes

- [What I learned][2]
- [Key points][3]
- [Challenge][4]


## What I learned

- How property wrappers become structs
- Presenting confirmation dialogs with lots of buttons
- Using Core Image to manipulate images
- Integrating **PHPickerViewController** into SwiftUI
- Writing coordinator classes that can act as delegates for image pickers
- Integrating maps into SwiftUI
- Dropping pins on maps
- Saving images to the user’s photo library
- Adding **Comparable** conformance to custom types
- Finding and writing to the user’s documents directory
- Enabling file encryption when writing
- Authenticating users with Touch ID and Face ID


## Key points

- Operator overloading
- Custom property wrappers




## Challenge

>Your goal is to build an app that asks users to import a picture from their photo library, then attach a name to whatever they imported. The full collection of pictures they name should be shown in a List, and tapping an item in the list should show a detail screen with a larger version of the picture.

>Breaking it down, you should:
- Wrap **PHPickerViewController** so it can be used to select photos.
- Detect when a new photo is imported, and immediately ask the user to name the photo.
- Save that name and photo somewhere safe.
- Show all names and photos in a list, sorted by name.
- Create a detail screen that shows a picture full size.
- Decide on a way to save all this data.
 

[1]: https://www.hackingwithswift.com/100/swiftui/77
[2]: https://www.hackingwithswift.com/guide/ios-swiftui/6/1/what-you-learned
[3]: https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points
[4]: https://www.hackingwithswift.com/guide/ios-swiftui/6/3/challenge
