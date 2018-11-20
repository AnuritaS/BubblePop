# Bubble pop

## Internship iOS Development Task

### Aim: Create a bubble pop game taking user input 'n' , where 'n' is more than 4 and bubbles follow the laws of physics like collision and burst on touch and moving in a random direction.

1. We take 'n' number of bubbles, we need to create from the user and store it..
2. We create those bubbles using SKSpriteNode of SpriteKit.
3. These bubbles move in a random fashion and collide with each other and the screen edges, thus not going off screen.
4. If you click on a bubble, it pops (is removed from the parent node).
5. When the count of bubble goes below 5, new bubbles are generated (n-4) bubbles.
6. The user can go back and choose to generate 'n' new number of bubbles.

### Techonlogy:
1. Xcode 10.0
2. Swift 4.2
3. Supports iOS 10+
4. Tested on iphone 7, iOS 12.0.1

### Challenges and Discovery:
1. As I have no prior experience with game development, I researched and found many different libraries we can use, which was time-consuming.
2. I got confused with using either SpriteKit, Particle Emitter or UIKitDynamics.
3. Found out that Particle Emitter and SceneKit are used for 3D Objects.
4. Found out that UIKitDynamics is not suitable for many objects.
5. Using render loop in SpriteKit was not creating the desired result and was wasting CPU power, thus we used repeat(count:) function.
6. In order to show a red circle on touching a bubble, we change it's texture to a red circle when touchBegins and pops the bubble when touch ends(finger is removed), this may sometimes result in userInteraction glitch , thus, we need to click properly on the bubble. If we do not change the bubble, and remove it in touchBegins, it easily gets popped.

[Check out the repo](https://github.com/AnuritaS/BubblePop)

