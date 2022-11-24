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
Navigator.push will plainly push a route onto the navigator stack. On the other hand, Navigator.pushReplacement will dispose the previous route after the new, requested route is pushed onto the navigator stack. <br>

## 2. List all the widgets you used in this project and explain their functions.
a) StatefulWidget: a widget that allows its state to change <br>
b) Scaffold: a class that provides many properties suitable to be a parent to many other widgets <br>
c) Center: a widget that centers its children within itself <br>
d) Column: a widget that arranges its children vertically (main axis) and possibly horizontally (cross axis) <br>
e) Row: a widget that arranges its children horizontally (main axis) and possibly vertically (cross axis) <br>
f) Text: a widget that displays and styles text <br>
g) FloatingActionButton: a circular button that hovers over content to promote a primary action in an application <br>
h) Visibility: a widget that modifies the visibility properties of its children <br>
i) Drawer: a widget that provides a menu which can be pulled out by clicking an icon <br>
j) Padding: a wrapper widget that provides padding properties <br>
k) Align: a wrapper widget that provides alignment properties <br>
l) Form: a widget which contains inputs and has the ability to validate and save their contents <br>
m) TextFormField: a form input widget that accepts text <br>
n) DropdownButtonFormField: a form input widget that provides a toggleable, contextual overlays for displaying a list of choices <br>
o) TextButton: a widget that displays a button and sets its functionality <br>
p) Expanded: a widget expands a child of a Row, Column, or Flex so that the child fills the available space <br>
q) Container: a general wrapper widget with many properties <br>
r) ListView: a scrolling widget that displays list widgets <br>
s) ListTile: a list widget that has a start, center, and end section <br>
t) Navigator: a widget that manages a set of pages with a stack discipline <br>

## 3. Name the types of events that exist in Flutter (example: onPressed).
a) onPressed: event where a widget (usually a button) is pressed <br>
b) onChanged: event where the contents of a widget changes <br>
c) onSaved: event that calls an optional method when the form is saved via FormState.save <br>
d) onTap: event where a widget (likely anything but a button) is tapped <br>

## 4. Explain how the Navigator works in "switching" pages of a Flutter application.
The Navigator widget manages elements called routes that displays the content of pages in the flutter app. Flutter offers an imperative API (Navigator 1.0) and a declarative API (Navigator 2.0) routing mechanism. <br>

In the imperative approach, the Navigator consists of a stack, a push method, and a pop method. The push method is for navigating to a newer page, while the pop method is for backtracking from the current page. The push method takes two arguments: a BuildContext (handle to the location of a widget in the widget tree) and a PageBuilder (used build the route's primary contents). The pop method only takes a BuildContext argument. <br>

In the declarative approach, when a list of Page objects are provided, the Pages API sets the history stack of the Navigator declaratively. Then, the Navigator inflates the Page objects into Routes. When the Page list changes, so does the corresponding Routes. Besides that, the Navigator also takes in an onPopPage callback that pops a page, and a transitionDelegate that decides how Routes transition on or off the screen. With those, the Navigator can handle the addition and removal of pages from the history stack. <br>

## 5. Explain how you implemented the checking list above.
First off, I wrote my Forms page. Using the lab assignment as a basis, I created forms.dart to contain my form. The form contained 2 TextFormField and 1 DropdownFormField inputs, each with validation and an onSave function. In the Form state, I included 3 properties to contain the title, amount, and budget type that is to be inputted in the form. Every time the input changes, so does the corresponding variable. The Form also contains a button that validates the inputs when clicked.<br>

After creating my form, I created a file called models.dart. This file contains a class called Model that lists 3 properties that describes the budget's title, amount, and type. I also included an initialization function. Then, I created an empty list that will contain instances of Model. <br>

Back to forms.dart, I initialized an empty model object. On each onSave function, that Model instance's properties are set to the 3 variables defined earlier. When the form is validated, the button runs all the save functions to modify the Model instance. The Model instance is then added into the list of Models. <br>

Finally, I created my Results page in result.dart. The Results page is similar to the Homepage and Forms, with the difference being that the contents are a ListView containing the properties of each Model instance inside the budget list. Using the ListView builder, the children of the Column inside the Scaffold's body are ListItems that describes each Model's contents. <br>

Whilst working, I also modified the imports as I went so that every dart file is interconnected with one another. <br>

Lastly, I started creating my drawer and navigator widgets. The Drawer I created, aside from Columns for the purposes of alignment, uses ListTiles that are able to be clicked. When clicked, the ListTiles uses the Navigation widget to move between pages that extend the StatefulWidget. The Navigation method used is pushReplacement to prevent the stack from filling up excessively. I then extracted the widget into a class and moved it into a separate file called drawer.dart. <br>

## References Assignment 8:
https://blog.logrocket.com/understanding-flutter-navigation-routing/ <br>
https://blog.codemagic.io/flutter-navigator2/ <br>

# Assignment 9: Essay Answers

## 1. Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
It is indeed possible to retrieve and serialize JSON data without using a model. This can be done via various methods, such as using code generation libraries, manually using dart convert, or using jsonDecode(). <br>
However, it is better to use a model because it lends more control to the programmer, such as being able to know the types of values at runtime, having type safety, autocompletions, and compile-time exceptions. Apps will also just simply not compile instead of crash at runtime when an error happens. <br> 

## 2. List the widgets that you used in this project and explain their functions.
The widgets I've used, excluding the ones I've mentioned in previous assignments, are:
a) GestureDetector: used to detect taps/presses on certain widgets <br>
b) Future: used to fetch JSON data asynchronously from Heroku <br>
c) ListView.builder: a quick way to generate infinite-scrolling ListViews that have a set length depending on a list (in this case, of JSON items) <br>
d) FutureBuilder: widget that builds itself based on the latest snapshot of interaction with a Future widget <br>

## 3. Explain the mechanism of retrieving data from json so it can be shown in Flutter.
First, the URI of the to-be-fetched data is parsed and stored in a variable. Then, using jsonDecode(), the URI's contents is decoded into a JSON string. The JSON string is then converted into JSON data objects based on a model created prior. Said objects are collected inside a list to be iterated and displayed in a page. <br>

## 4. Explain how you implemented the checklist above.
I created a model called Watchlist using Quicktype first-and-foremost. After copy-and-pasting the model into a dart file, I created a Future function to fetch the data and feed it into the model to create objects inside a dart file called mywatchlist_future. <br>
Then, I created a display page (linked to other pages via drawer) that will use the list of objects to display the title of every movie inside a ListView. After that, using a GestureDetector wrapper, I defined an onTap() event on each ListView to direct the screen to another page that displays the details of that movie. The fields/properties of that movie is passed on as variables of the detail page's state. <br>



