#Build Project
================

##Build app
----------
After cloning the project, type in the terminal:
'''docker-compose build'''

##Starting containers
----------
After building the project, upload the container:
'''docker-compose up'''

##Creating Database (necessary in first time)
----------
Create the local database by following these steps:
1) '''docker-compose run billinho rake db:create'''
2) '''docker-compose run billinho rake db:migrate'''

##Acessing the app
----------
'''http://localhost:3000'''

to access application routes, you must create a user.
type in the terminal:
1) '''docker-compose exec billinho rails c'''
2) '''User.create(email:"...", password:"...")'''
3) '''User.where(email:'...').pluck(:authentication_token)'''

Use the email and authentication_token in headers to acess app routes
