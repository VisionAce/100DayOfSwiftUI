# Day 73: Project 14: BucketList

Follow along at 
- [Day 73 –  Project 14, part six][1]

# 📒 Field Notes
Challenge


## Challenge 1

> Our + button is rather hard to tap. Try moving all its modifiers to the image inside the button – what difference does it make, and can you think why?

We don't quite need to put all modifiers inside the button -- but certainly the ones that would determine the surface area of the content:

                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(.black.opacity(0.75))
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        .clipShape(Circle())
                        .padding(.trailing)

[Commit][2]

## Challenge 2

> Our app silently fails when errors occur during biometric authentication, so add code to show those errors in an alert.

- [ContentView][3]
- [ContentView-ViewModel][4]

## Challenge 3

> Create another view model, this time for **EditView**. What you put in the view model is down to you, but I would recommend leaving **dismiss** and **onSave** in the view itself – the former uses the environment, which can only be read by the view, and the latter doesn’t really add anything when moved into the model.

- [EditView][5]
- [EditView-ViewModel][6]

## Tip

 That last challenge will require you to make a **StateObject** instance in your **EditView** initializer – remember to use an underscore with the property name!
 
 

[1]: https://www.hackingwithswift.com/100/swiftui/73
[2]: 
[3]: 
[4]: 
[5]: 
[6]:
