
# Express REST API

Express REST API using Node.js and JSON as a database.

## Features

- Fully functional.
- Validation using **express-validator**.
  * Check if the input is valid.
  * Check if the user  exists in the database.
- Secured using key authorization.

## Routes

| Method | Endpoint | Description |
| ------ | ------ | ------ |
| GET | /actresses | Get all the actresses. |
| GET | /actresses/:id | Get actress by id. |
| POST | /actresses | Add new actress. |
| POST | /register | Register new user. |
| POST | /user | Get user data. |
| PUT | /actresses/:id | Update actress by id. |
| DELETE | /actresses/:id | Delete actress by id. |

## Key authorization
There is two ways to get authorized.

#### 1. Query string:
```
GET http://localhost:3000/endpoint?api_key=172uujqoyz1s33bnm6ow2te44s2i90
```
#### 2. Header (using curl):
```
curl -H "x-api-key: 172uujqoyz1s33bnm6ow2te44s2i90" http://localhost:3000/endpoint
```

## Installation & Setup

#### 1. Clone the repository.
```
git clone https://github.com/thechampagne/express-rest-api.git
```
#### 2. Navigate to the directory.
```
cd express-rest-api
```

#### 3. Install the dependencies.
```
npm install
```
#### 4. Start the application.
```
npm start
```
#### 5. Open http://localhost:3000.

## License

[MIT](https://github.com/thechampagne/express-rest-api/blob/master/LICENSE)