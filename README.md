# Mobile-Store-System
An attractive and user-friendly website for mobile ordering in stores.  
This project was bootstrapped with - [Node.js](https://nodejs.org/en/docs/) & [Express](https://expressjs.com/en/guide/routing.html)

- Databases used MySql & Mongo  
- Developed using JavaScript, [Handlebars](https://handlebarsjs.com/guide/#what-is-handlebars) and [Passport.js](https://www.passportjs.org/)

## Features
* Store retailer can add or update details of mobiles in store
* Retailer can take reviews/complains about mobiles, and share the review with the mobile company.
* Search mobile by name
* Retailer can place orders for mobiles from the customer
* He can also manage customer details and track order details

## Installation

Install the required node_modules

```bash
npm install
```
    
## Environment Variables
To run this project, you will need to add the following environment variables to your .env file

`DB_HOST`
`DB_NAME`
`DB_USER`
`DB_PASS`

Refer `.env` for more info

## Run Locally


- Use the `mobile_store.sql` file for SQL database
- Start your Sql (Xampp) and MongoDB server
- Ensure you have installed the node_modules

Start the server

```bash
  npm start
```
Runs the app in development mode  
Open [http://localhost:5000]() to view it in the browser.

### Sample output
![mobile_list](https://user-images.githubusercontent.com/88207381/201148732-06d79c0f-3144-4768-88e2-71526664a84c.png)


