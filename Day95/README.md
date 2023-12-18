# Day 95: Milestone: Projects 16-18

Follow along at 
- [Day 95 – Milestone: Projects 16-18][1]

# 📒 Field Notes

- [What you learned][2]
- Key points
- Challenge
 
 
## Key points

- Functional programming

Functions that accept a function as a parameter, or send back a function as their return value, are called higher-order functions

  - map()
  - filter()
  - compactMap()
    - Runs a transformation function over every item in an array, just like **map()**. 
    - Unwraps any optionals returned by that transformation function, and puts the result into a new array to be returned.
    - Any optionals that are **nil** get discarded.
    
      let numbers = ["1", "2", "fish", "3"]
      let evensMap = numbers.map(Int.init)
      let evensCompactMap = numbers.compactMap(Int.init)


- Result

該型別用於簡單地返回成功或失敗的單一值

  - Result類型在某種程度上類似於Optional
    - Optionals和Result都是作為Swift枚舉(enum)的一種
      - Optionals的枚舉名稱是Optional，包含:
        - .none表示nil
        - some並帶有相應值（整數、字符串等）
      - Result的兩個枚舉值:
       - .success
       - .failure

  - Result和拋出異常（throwing）的函數之間可以互換使用
  
  如果你有一個Result，想要轉換為do/catch區塊，只需調用Result的get()方法，它會返回成功的值（如果存在），否則拋出錯誤。
  
    - 方法一：
    
           enum NetworkError: Error {
               case badURL
           }
           
           func createResult() -> Result<String, NetworkError> {
               return .failure(.badURL)
           }
           
           let result = createResult()
           
           do {
               let successString = try result.get()
               print(successString)
           } catch {
               print("Oops! There was an error.")
           }

   - 方法二：
   
           let result = Result { try String(contentsOf: someURL) }
           
    Result將是一個 Result<String, Error> - 它沒有特定類型的錯誤，因為 String(contentsOf:) 不會返回任何錯誤。
    
    
## Challenge

> At the very least you should lets users roll dice, and also let them see results from previous rolls. However, if you want to push yourself further you can try one or more of the following:

- Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
- Show the total rolled on the dice.
- Store the results using JSON or Core Data – anywhere they are persistent.
- Add haptic feedback when dice are rolled.
- For a real challenge, make the value rolled by the dice flick through various possible values before settling on the final figure.





## 📸 Screenshots





[1]: https://www.hackingwithswift.com/100/swiftui/95
[2]: https://www.hackingwithswift.com/guide/ios-swiftui/7/1/what-you-learned
