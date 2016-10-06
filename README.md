# NCSU Library Room Reservation Portal, a Ruby on Rails Web App

PLEASE use Mozilla Firefox while reviewing our application. 

Application Link: https://ncsu-library.herokuapp.com/

Preconfigured Credentials: (Please don't change these credentials. We don't want our reviewers to experience troubles.)

         User Type              Email ID.       Password
    
       Super Admin :      sadmin@ncsu.edu     adminADMIN
    
             Admin :       admin@ncsu.edu     adminADMIN
    
    Library Member : prathamesh@gmail.com  user_password
    
    Library Member :    shankar@gmail.com  user_password
    
    Library Member :      vivek@gmail.com  user_password
    
Landing page of the app :

1. Accepts the email id and password from the existing user and takes the user to the user home page.
2. Signup : Takes the new user to the signup page.
    
Super Admin Functionality :

1. The home page ( also Manage Reservations tab on the header bar ) lists all the reservations in the system.
a. The show functionality redirects to a new page where the details of the reservation are present.
b. The release functionality allows the super admin to release any reservation ( updates the reservation as released ).

2. The Manage Users/Admins tabs redirects to a table that lists all the users.
a. The show functionality redirects to a new page where the details and reservations of the user are present.
b. The edit functionality allows the super admin to edit the name, email id and change the role of all users ( can't demote self to user ).
c. The delete functionality allows the super admin to delete any user ( othere than self ). Once a user is deleted all reservation under said user are deleted from the records of the respective rooms.

3. The Manage Rooms tabs redirects to a table that lists all the rooms.
a. The Show Details/History functionality redirects to a new page where the details and reservations of the room are present.
b. The edit functionality allows the super admin to edit the name, size and change the building in which the room is present.
c. The delete functionality allows the super admin to delete any room. Once a room is deleted all reservation under said room are deleted from the records of the respective users.

4. The Reserve for a member tab redirects to a page where the super admin can make reservations for any user.
a. The super admin can select any user by email id from the Select User drop dow.
b. The super admin can select any building from the Select Building drop dow.
c. The super admin can select any date ( in the next 7 days ) from the date bar in the under Booking Date.
d. The super admin can select the room size from the Select size of Room drop down.
e. The super admin can add the start and end time for the reservation in the respective text boses ( reservations have to be within 2 hours of duration ).
f. Once the super admin adds all the details and presses the Search for Availlable Rooms button :
i. The page redirects and a new tab titled Availlable Rooms is present with a drop down containing all the rooms that match the criterion.
ii. Choose a room and press the Reserve button.
iii. The page redirects to a new view that displays the confirmation of the reservation.

5. The Edit Profile tab redirects to a page where the super admin can change his/her name, email id and password.

6. The Logout tab signs out the super admin from the system.
