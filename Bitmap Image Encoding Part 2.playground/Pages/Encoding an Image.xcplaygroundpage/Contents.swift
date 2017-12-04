//: [Previous](@previous) / [Next](@next)
//: # Encoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Choose an image
 Before we begin, you need an image to encode.
 
[Create your own](https://drive.google.com/file/d/0B28WCEVcCDJWQUM3RVlvdEVzVVk/view) (a hard copy is available if you are reading this in class).
 
 Now, finish declaring the multiline string below.
 
 This string will contain your encoded image.
 
 The codes currently provided will result in the letter "a".
 */
// Write the encoding for your image here
let encodedBitmap = """
20a
20a
8a,5b,7a
6a,9b,5a
5a,11b,4a
4a,12b,4a
4a,2b,1c,7b,1c,2b,2a
3a,2b,1c,9b,1c,2b,2a
3a,1b,1c,1b,2c,5b,2c,1b,1c,1b,2a
3a,2b,1c,2b,1c,3b,1c,2b,1c,2b,2a
3a,2b,1e,9b,1e,2b,2a
3a,1b,2e,9c,2e,1b,2a
3a,1d,2e,1c,7f,1c,2e,1d,2a
3a,2d,2b,7c,2b,2d,2a
5a,3b,5c,3b,4a
6a,9b,5a
8a,5b,7a
20a
20a
20a
"""

/*:
 ## Printing individual characters of a string
 
 Just like a single-line string, we can use a *for-in* loop to examine each individual character of a multi-line string.
 
 In this case, we'll print each character on it's own line.
 
 Look carefully at the output.
 
 How are newline characters rendered in the output?
 */
// Uncomment the next three lines of code to see how they work
for character in encodedBitmap {
    print(character)
}

// I notice that newline characters are rendered as an...


/*:
 Now, **remember to commit and push your work**.
 */

