

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources.
 For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions
Welcome to That's a Lot of Pressure!

This is an interactive app that allows the user to log their blood pressure once a day and receive food recommendations if that input is out of the range of normal/healthy blood pressure.

Upon creation of an account, a user is given an unique ID number that they must use to log in to the app. A feature yet to be added is 3 factor authentication if the user forgets this ID number. Future versions will ask the user for a birthdate, an answer to a security question and their own 5 digit pin number upon creation of an account so they can retrieve their login info.

Once logged in, the user can either view the last 5 foods recommended to them or a menu of previous food recommendations sorted by date. A user can only access this information if they have previously logged a blood pressure and will be prompted to do so if they don't have any readings.

If a user doesn't like a food recommendation, they will be able to delete it and get another. Likewise, a user can re-input their blood pressure for the day. Additionally they can clear all food recommendations and all blood pressure readings.
