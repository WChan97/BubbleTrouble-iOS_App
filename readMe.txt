Hello!
12569582 Walter here!

This is my current project at 17/05/17.

Changes to the file made:
-Added this document.
-Recompressed the file to .zip on Windows. (Let's hope nothing breaks)

References:

https://www.youtube.com/watch?v=lRmuxppYQ4o
- This was used to help me create the first version of the game, where I used Buttons to take score.
- This instance also assisted me in creating a segue, a timer, which I later developed into a means of label updating.

https://www.raywenderlich.com/66877/how-to-make-a-game-like-candy-crush-part-1
https://www.raywenderlich.com/66915/how-to-make-a-game-like-candy-crush-part-2
- This was adapted to help create a scene, a level for that scene, bubble objects.
- It was extremely helpful as it provided a base and leads for me to learn from.
- For example, it created a method to detect chains and remove them. 
- For me, I converted it to checking the bubble pressed, and remove it.

http://stackoverflow.com/questions/5654470/plist-what-it-is-and-how-to-use-it
- I tried to look at how to used PLists
- Due to the time constraints, I was unable to implement.

Notes from me:
- This project was rather difficult to construct.
- I do not own a mac, so the only time I had to build the project was during class and/or times when the open labs were not booked.
- With that, I was unable to experiment too much with code, if I had an idea, it had to be implemented within the time I allocated to work in the labs.

- The ideas that did not succeed ultimately were scrapped, and reattempted with a different method the next time.
- Some of these were commented out or reference deleted (to the project).

- The tutorial videos provided by UTS used an older version of XCode to the labs. 
- This means that constraints were slightly different. 
- I experimented with some, and found the last tab on properties to work wonders.

- Segues were a bit of a problem, as regardless of the presented view, it passes.
- This means that a value is sent (and recieved) from controllers.
- If I do not synthesize, nor use the sent values, a crash occurs.

- A crash (runtime error probably) occurs during bubble generation, when there is too much for the game to handle.
- This is due to destroying a bubble, as it's being created.
- I have no idea why this happens, but it does.

Thanks for reading this document.

12569582
- 