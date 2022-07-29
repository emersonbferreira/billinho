Build Project
================

Build app
----------
After cloning the project, type in the terminal:

```docker-compose build```

Starting containers
----------
After building the project, up the container:

```docker-compose up```

Creating Database (necessary in first time)
----------
Create the local database by following these steps:

1) ```docker-compose run billinho rake db:create```
2) ```docker-compose run billinho rake db:migrate```

Acessing the app
----------
to access application routes, you must create a user.
type in the terminal:
1) ```docker-compose exec billinho rails c```
2) ```User.create(email:"...", password:"...")```
3) ```User.where(email:'...').pluck(:authentication_token)```

Use the email and authentication_token in headers to acess app routes:

```http://localhost:3000/studens```
```http://localhost:3000/enrollments```
```http://localhost:3000/institutions```
```http://localhost:3000/invoices```

![Captura de tela de 2022-07-29 10-31-22](https://user-images.githubusercontent.com/85513624/181771089-e4eeaa90-4de2-4573-998a-8bc3b498d329.png)


Databse diagram
----------
![Captura de tela de 2022-07-28 18-41-44](https://user-images.githubusercontent.com/85513624/181642556-ceeab87f-89d7-4ce8-b4ad-59535127ae3c.png)

