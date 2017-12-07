//: [Previous](@previous) / [Next](@next)
//: # Decoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Decoding the text
 Now we will (at last!) decode the image.
 
 Recall, our rules are:
 
 * If a line starts with a 0, the first pixel is black.
 * If a line does not start with a 0, the first pixel is white.
 * When a comma is encountered, a new number begins, and the colour switches.
 * When a newline character is encountered, go to a new row in the image.
 * Once we have a new number, we draw that many pixels in the current colour.
 
 First, copy and paste your encoded image string to this page.
*/

// Copy your encoded image string here...
let encodedBitmap = """
a9,a9,a2
a3,b1,c1,b1,c1,b1,c1,a9,a2
a3,b1,c5,b1,c1,b1,c1,a9,a1
a3,b1,c9,b2,a5
a2,b1,c9,c2,b1,a5
a2,b1,c9,c2,b1,a5
a2,b3,c1,b4,c3,b1,a6
a1,b1,d3,b1,d4,b1,c2,b1,,a6
a1,b1,d1,b1,d1,b1,d2,b1,d1,b1,c2,b1,a6
a1,b1,d3,b1,d4,b1,c1,b1,a7
a1,b4,d4,b1,c1,b1,a8
a2,b1,c3,b4,c2,a9
a1,b1,c1,b2,c7,a8
a1,b1,c9,c1,a8
a1,b1,c7,b1,c1,b1,a8
a2,b7,c2,b1,a8
a5,b2,c4,b1,a8
a6,b5,a9
a9,a9,a2
a9,a9,a2




"""

// Make a canvas
let canvas = Canvas(width: 402, height: 402)

// Make a grid
// NOTE: The code that builds the grid was tucked away in something called a *function* to keep things tidy. We'll learn about functions later.
drawGrid(on: canvas)

// Start drawing at left
var x = 0

// Set the size of a "pixel"
let cellSize = 20

// Keep track of current colour
var currentColor = "white"

// Start drawing at top of grid
var y = canvas.height - cellSize - 2

// Store the current number of pixels to draw
var drawThisManyPixels = 0

// Iterate over each character in the encoded bitmap string
for character in encodedBitmap {
    
    // Set colour at start of a line
    if character == "0" {
        
        canvas.fillColor = Color.black
        currentColor = "black"

    } else if character == "," {
        
        // We have a new number
        // Are we past the first pixel in a row?
        if x > 0 {

            // Toggle the pixel colour
            if currentColor == "black" {
                currentColor = "white"
                canvas.fillColor = Color.white
            } else {
                currentColor = "black"
                canvas.fillColor = Color.black
            }

        }
        
    } else if character == "\n" {
        
        // We are on a new line, so reduce the vertical position
        // and reset the horizontal position
        y = y - cellSize
        x = 0
        
        // Default colour after new line is white
        canvas.fillColor = Color.white
        currentColor = "white"
        
    } else if character == "a" {
        
        canvas.fillColor = Color.red
        currentColor = "red"

    } else if character == "b" {
        
        canvas.fillColor = Color.black
        currentColor = "black"
        
    } else if character == "c" {
        
       canvas.fillColor = Color.yellow
        currentColor = "yellow"
    } else if character == "d" {
        
        canvas.fillColor = Color.white
        currentColor = "white"
        
    }  else {
        
        // Get the new number of pixels to draw
        drawThisManyPixels = Int(String(character))!
        
        // Draw the pixels
        for _ in 1...drawThisManyPixels {

            // Draw the enlarged "pixel"
            canvas.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: cellSize, height: cellSize)
            
            // Increase x so that the next pixel is drawn to the right of this one
            x += cellSize

        }

    }
    
}

/*:
 ### Check the results
 Does the output match what you'd expect, based on the values in the encoded string?
 
 How do you know?
 
 Write your ideas in the code comment below.
 */

// I notice that...
// I know this because...

/*:
 ## Extension
 Now that you have an understanding of how if statements (also called *selection* statements or *conditional* statements) work... extend this code.
 
 How could you adjust the rules so that pixels can be rendered in colour?
 
 What additions or changes would you need to make to the code above?
 
 Work with a partner to discuss possibilities and then make the changes in code.
 */


/*:
 Now, **remember to commit and push your work**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
