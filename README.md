# AC-iOS-Unit2Final

# Setup

1. Clone **your fork** locally to your laptop.
2. Work on the assignment.
3. Upon completion, commit locally.

	```
	git commit -a -m "I'm done"
	```
4. Push to your repo.

	```
	git push origin master
	```
5. Go to github and make a pull request.
6. Paste **your fork** link into canvas 

# The Assessment

### Overview

Your app is to have two tabs. The first tab should contain a table that displays a list of Crayon names
with their backgrounds set to the corresponding color. The second tab is to have a single view controller
that has a Slider, a Stepper, a Text Field, and a Label whose values are all sync'd together. These two tabs
don't have any relationship to each other, other than being tabs in the same app.


1. Build the View Controller architecture as depicted in this image:

<img src="https://github.com/C4Q/AC-iOS-Unit2Final/blob/master/StoryBoard.png" />


Set the background color of the rows by building a UIColor from with the crayon's red, green, and blue 
properties and set the textLabel's text to the color name. You **don't** need to subclass the Table View Cell
to do this. Just use the default ```UITableViewCell```.

1. Implement ```prepare(for:)``` (prepare for segue) on the table view controller in order to pass the
color information over to the detail view controller (the rightmost in the screen shot above), which I named
Crayon View Controller. This view controller should have a label with the color name and color its background
just as you did with the table cell row.

1. In the other tab build your view controller, connecting outlets and actions as appropriate to 
the Slider, Stepper, Text Field controls and Label in order to live update any value set on one to
update all the others.

1. Comment the methods you end up implementing, noting whether it's a target-action method or 
a delegate method.
