FP7-webpage Title of Project
This is a template for using your repo's README.md as your project web page. I recommend you copy and paste into your README file. Delete this line and the one above it, customize everything else. Make it look good!

Authors

Donovyn Pickler

Naman Jiandani


Overview

A brief description of the project is given here. The description is 1 to 3 sentences long. Be concise and clear.
This project is a client-server chat application. Once connected, clients are able to interact with each other through the server. 

![There should be a diagram here](https://github.com/oplS16projects/Donovyn_Naman_MultiUserDungeon/blob/master/updated%20racket%20diagram.png?raw=true "Architecture Diagram")

Screenshot

(insert a screenshot here. You may opt to get rid of the title for it. You need at least one screenshot. Make it actually appear here, don't just add a link.)

Here's a demonstration of how to display an image that's uploaded to this repo: screenshot showing env diagram

Concepts Demonstrated

Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient.

Data abstraction is used to provide access to the elements of the RSS feed.
The objects in the OpenGL world are represented with recursive data structures.
Symbolic language processing techniques are used in the parser.
External Technology and Libraries

Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).

Favorite Scheme Expressions

Donovyn

Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody? Remember code looks something like this:

(map (lambda (x) (foldr compose functions)) data)


Naman

This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....

(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
Additional Remarks


Anything else you want to say in your report. Can rename or remove this section.

How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc.




# Project Title: Multi User dungeon
### Statement
<!-- Describe your project. Why is it interesting? Why is it interesting to you personally? What do you hope to learn?  -->
**D,N:** This project will involve both client and server programs, once connected, clients should be able to interact with the server and each other.  I find this interesting because I am a bit of a game historian, and old text adventures and MUDs are a staple of both gaming and computer science departments.  I hope to learn a bit more about network connections and interactions, I don't know nearly as much as I should/want to in that area.


The slides are Here:  https://docs.google.com/presentation/d/18e4MwN-EA52GHHfoGgb2-OiBMO30s8RlIg73MlLGwFk/edit?usp=sharing

### Analysis
<!--Explain what approaches from class you will bring to bear on the project. Be explicit: e.g., will you use recursion? How? Will you use map/filter/reduce? How? Will you use data abstraction? Will you use object-orientation? Will you use functional approaches to processing your data? Will you use state-modification approaches? A combination?-->

**D:**  Each user will be assigned a user object, which will then be stored on a hash table.  more to be added <TODO>

**N:** We we wll be using the windowing component of the racket/gui toolbox for an appealing front end. There will be alot of event handling!

<!--The idea here is to identify what ideas from the class you will use in carrying out your project. -->

### Data set or other source materials
<!--If you will be working with existing data, where will you get those data from? (Dowload it from a website? access it in a database? create it in a simulation you will build....)

How will you convert that data into a form usable for your project?  

Do your homework here: if you are pulling data from somewhere, actually go download it and look at it. Explain in some detail what your plan is for accomplishing the necessary processing.

If you are using some other starting materails, explain what they are. Basically: anything you plan to use that isn't code.
-->

**D,N:** There are some examples of chat servers around that we plan to take a look at and desconstruct. 



### Deliverable and Demonstration
<!--Explain exactly what you'll have at the end. What will it be able to do at the live demo?

What exactly will you produce at the end of the project? A piece of software, yes, but what will it do? Here are some questions to think about (and answer depending on your application).

Will it run on some data, like batch mode? Will you present some analytical results of the processing? How can it be re-run on different source data?

Will it be interactive? Can you show it working? This project involves a live demo, so interactivity is good.-->

**D:** the server should be able to accept connections and interactions from multiple users as well as push the results of those interactions to other users.  For the live demo the plan is to have a few laptops networked together with a hub and allow drop-in/drop-out play.

**N:**User specific UI's that are sensitive to some aspect of the users data. These will be interactive, ofcourse. Event handling will enable us to re-create a real-life chat room functionality.

### Evaluation of Results
<!-- How will you know if you are successful? 
If you include some kind of _quantitative analysis,_ that would be good. -->

**D,N:**  If stable connections can be made between the server and multiple clients, and if interactions between them can be meaningful to an end user.



## Architecture Diagram
<!--Upload the architecture diagram you made for your slide presentation to your repository, and include it in-line here.

Create several paragraphs of narrative to explain the pieces and how they interoperate.-->

The slides are Here:  https://docs.google.com/presentation/d/18e4MwN-EA52GHHfoGgb2-OiBMO30s8RlIg73MlLGwFk/edit?usp=sharing

![There should be a diagram here](https://github.com/oplS16projects/Donovyn_Naman_MultiUserDungeon/blob/master/updated%20racket%20diagram.png?raw=true "Images made in paint.net, yaaaaaaay.")


## Schedule
<!--Explain how you will go from proposal to finished product. 

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc. 

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system. -->


### First Milestone (Fri Apr 15)
<!-- What exactly will be turned in on this day?  -->

**D:**  Server that is accepting connections between clients and also accepting and handling messages, (though maybe not yet propagating them to other users).

**N:** All GUI libraries have been explored for contextual functionality and extensively played with, even handling functionality is mastered for adoption in the program (system dispatched internal timer events and explicitly queued events will also be looked into).
First prototype of each UI will be in place.

### Second Milestone (Fri Apr 22)
<!-- What exactly will be turned in on this day?  -->

**D:**  Propagation of messages across the userbase allowing for basic chat, a number of server commands, and a number of interactions with the game world.

**N:**As the build progresses, we will be adding additional features in the user interface that are reflective of the back end functionality we hope to accomplish with this chat room. Hard to speak of the additioanl features yet, but there will be many!

### Final Presentation (last week of semester)
<!-- What additionally will be done in the last chunk of time? -->

**D:**  Error corrections, additional functionality, general polish, and a complete list of server commands (Name and function).

**N:** Polished layout and cohesive, enveloping functionality of backend and frontend.


## Group Responsibilities
<!-- Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable. -->

### Donovyn Pickler @draconicdon
Will work on the server and general back end programming.

### Naman Jiandani @naman1255
The Client and general front end programming.
