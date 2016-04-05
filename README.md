# Project Title: Multi User dungeon
### Statement
<!-- Describe your project. Why is it interesting? Why is it interesting to you personally? What do you hope to learn?  -->
**D:** This project will involve both client and server programs, once connected, clients should be able to interact with the server and each other.  I find this interesting because I am a bit of a game historian, and old text adventures and MUDs are a staple of both gaming and computer science departments.  I hope to learn a bit more about network connections and interactions, I don't know nearly as much as I should/want to in that area.

**N:**

### Analysis
<!--Explain what approaches from class you will bring to bear on the project. Be explicit: e.g., will you use recursion? How? Will you use map/filter/reduce? How? Will you use data abstraction? Will you use object-orientation? Will you use functional approaches to processing your data? Will you use state-modification approaches? A combination?-->

**D:**  Each user will be assigned a user object, which will then be stored on a hash table.  more to be added <TODO>

**N:**

<!--The idea here is to identify what ideas from the class you will use in carrying out your project. -->

### Data set or other source materials
<!--If you will be working with existing data, where will you get those data from? (Dowload it from a website? access it in a database? create it in a simulation you will build....)

How will you convert that data into a form usable for your project?  

Do your homework here: if you are pulling data from somewhere, actually go download it and look at it. Explain in some detail what your plan is for accomplishing the necessary processing.

If you are using some other starting materails, explain what they are. Basically: anything you plan to use that isn't code.
-->

**D:** There are some examples of chat servers around that I plan to take a look at and desconstruct. 

**N:**

### Deliverable and Demonstration
<!--Explain exactly what you'll have at the end. What will it be able to do at the live demo?

What exactly will you produce at the end of the project? A piece of software, yes, but what will it do? Here are some questions to think about (and answer depending on your application).

Will it run on some data, like batch mode? Will you present some analytical results of the processing? How can it be re-run on different source data?

Will it be interactive? Can you show it working? This project involves a live demo, so interactivity is good.-->

**D:** the server should be able to accept connections and interactions from multiple users as well as push the results of those interactions to other users.  For the live demo the plan is to have a few laptops networked together with a hub and allow drop-in/drop-out play.

**N:**

### Evaluation of Results
<!-- How will you know if you are successful? 
If you include some kind of _quantitative analysis,_ that would be good. -->

**D:**  If stable connections can be made between the server and multiple clients, and if interactions between them can be meaningful to an end user.

**N:**

## Architecture Diagram
<!--Upload the architecture diagram you made for your slide presentation to your repository, and include it in-line here.

Create several paragraphs of narrative to explain the pieces and how they interoperate.-->

<!--The slides are Here:  https://docs.google.com/presentation/d/18e4MwN-EA52GHHfoGgb2-OiBMO30s8RlIg73MlLGwFk/edit?usp=sharing-->

**D:**

**N:**

## Schedule
<!--Explain how you will go from proposal to finished product. 

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc. 

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system. -->

**D:**

**N:**


### First Milestone (Fri Apr 15)
<!-- What exactly will be turned in on this day?  -->

**D:**  Server that is accepting connections between clients and also accepting and handling messages, (though maybe not yet propagating them to other users).

**N:**

### Second Milestone (Fri Apr 22)
<!-- What exactly will be turned in on this day?  -->

**D:**  Propagation of messages across the userbase allowing for basic chat, a number of server commands, and a number of interactions with the game world.

**N:**

### Final Presentation (last week of semester)
<!-- What additionally will be done in the last chunk of time? -->

**D:**  Error corrections, additional functionality, general polish.

**N:**


## Group Responsibilities
<!-- Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable. -->

### Donovyn Pickler @draconicdon
Will work on the server and general back end programming.

### Naman Jiandani @naman1255
The Client and general front end programming.
