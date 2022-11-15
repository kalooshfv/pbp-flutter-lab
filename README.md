# Assignment 7: Essay Answers

## 1. Explain what is meant by stateless widget and stateful widget and explain the difference between them.
Flutter widgets are powerful objects inspired from React that help build an application's UI. From that, widgets generally fall into one of two groups, which are stateless widgets and stateful widgets. <br>
A widget in flutter has a "state" that is stored in a State object. When a widget's state changes, the widget rebuilds its description which in turn changes its appearance and contents. A StatefulWidget object allows that widget's state to change, hence its possible responsiveness to user input (e.g. Checkbox, Slider, Form, TextField). A StatelessWidget object never changes its state, and will stay the same regardless of user input (e.g. Icon, IconButton, Text). <br>

## 2. Mention what widgets you use in this project and explain their functions.
The widgets I've used for this project is: <br>
a) StatefulWidget: a widget that allows its state to change <br>
b) Scaffold: a class that provides many properties suitable to be a parent to many other widgets <br>
c) Center: a widget that centers its children within itself <br>
d) Column: a widget that arranges its children vertically (main axis) and possibly horizontally (cross axis) <br>
e) Row: a widget that arranges its children horizontally (main axis) and possibly vertically (cross axis) <br>
f) Text: a widget that displays and styles text <br>
g) FloatingActionButton: a circular button that hovers over content to promote a primary action in an application <br>
h) Visibility: a widget that modifies the visibility properties of its children <br>
<br>

## 3. What is the function of setState()? Explain what variables can be affected by the function.
setState() is a function in flutter that notifies the framework when the internal state of an object changes such that the framework can schedule a build for said object. When implementing a StatefulWidget, or changing the state of any object, it is best to make the change in a function that will be passed onto setState().
Without setState(), it is possible that the change will not be detected and the UI will not be updated.
The State object, along with any variables inside it, can be affected by setState(). In Assignment 7, the variables impacted are _counter. <br>

## 4. Explain the difference between const and final.
const and final both prevent a variable from being reassigned, but the difference is that const must know its value at compile-time, wheras final must know its value at run-time. This plays into effect for variables such as Datetime.now(), which can only get its value when its line is executed. Thus, Datetime.now() cannot be assigned to const, though it can be assigned to final. <br>

## 5. Explain how you implement the checklist above.
First, I initialized my project using flutter create, and then creating a git repository in the local folder I created. After adding all the flutter project's files into the repo, and committing it, I pushed it into an empty repository on GitHub. <br>
After creating the project, I continued to modify main.dart. I first implemented a decrementCounter() function that decrements the counter if the counter variable is not 0. Then, after searching for ways to create 2 floating action buttons side-by-side on the Internet, I decided on using a Padding widget that contains a Row widget with mainAxisAlignment set to spaceBetween. Then, I set floatingActionButtonLocation to centerDocked. This creates 2 floating action buttons with equal spacing on the bottom of the screen. I then specified the functions each button will execute when pressed, and set its icons and colors. <br>
Moving forward, I set a private function in the State object named btnText that will return a string that changes its contents depending on the counter being even or odd. I created a Text widget that displays the btnText text, that also changes colors depending on the counter being even or odd, right above the Text widget that displays the counter. <br>
Last but not least, I included a Visibility widget to be the parent of the FloatingActionButton widget of the decrement button I created previously. I then created another private function isVisible that returns a negative boolean value when the counter reaches 0. The visible property on the previously made Visibility widget will then depend on the isVisible function's output. <br>
Finally, I git-add-commit-pushed my project onto GitHub.

# Assignment 8: Essay Answers

## 1. Explain the difference between Navigator.push and Navigator.pushReplacement.

## 2. List all the widgets you used in this project and explain their functions.

## 3. Name the types of events that exist in Flutter (example: onPressed).

## 4. Explain how the Navigator works in "switching" pages of a Flutter application.

## 5. Explain how you implemented the checking list above.




