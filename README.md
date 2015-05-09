WordBox Server
==============

The server for WordBox. An app for making silly videos with friends

# Docs
Layout of doc:
``` 
HTTP_REQUEST_TYPE /path/
{
    "example": "request data"
}

{
    "example": "return data"
}
```
__All requests must include header `Content-Type: application/json`__
## Register user 
```
POST /auth/
{
    "email": "ted.eriksson@me.com",
    "password": "ted12345",
    "username": "ted"
}

{
    "status": "success",
    "data": {
        "id": 9,
        "email": "ted.eriksson@me.com",
        "created_at": "2015-05-09T16:03:11.349Z",
        "updated_at": "2015-05-09T16:03:11.513Z",
        "username": "ted",
        "provider": "email",
        "uid": "ted.eriksson@meeee.com",
        "image": null
    }
}
```
## Sign in
Email is used to sign in
```
POST /auth/sign_in
{
    "email": "ted.eriksson@me.com",
    "password": "ted12345"
}

{
    "data": {
        "id": 6,
        "email": "ted.eriksson@me.com",
        "username": null,
        "provider": "email",
        "uid": "ted.eriksson@me.com",
        "image": null
    }
}
```
The return data will have the headers needed to use authenticated api calls. See an example of the required headers below. After each auth api call the headers change, to use client must keep up to date by saving the headers from the last return data.
```
Content-Type: application/json
Access-Token: spxagwOKf8PIpzO9AwXjYg
Uid: ted.eriksson@me.com
token-type: Bearer
client: KaCdCDUXTGYmVKoX2RX-6Q
expiry: 1432387616
```
##__API calls below this point require auth__
## Show user
```
GET /users/:id
{}
{
    "id": 7,
    "created_at": "2015-05-09T15:49:41.045Z",
    "updated_at": "2015-05-09T15:52:37.108Z",
    "username": "ted",
    "provider": "email",
    "uid": "ted.eriksson@me.com",
    "image": null,
    "email": "ted.eriksson@me.com",
    "sentences": [ ],
    "friends": [ ]
}
```
## Errors
Errors are returned in this format
```
{
"status": "error",
"data": {
        "id": null,
        "created_at": null,
        "updated_at": null,
        "username": "teee",
        "provider": "email",
        "uid": "",
        "image": null,
        "email": "ted.eriksson@meeee.com"
    },
    "errors": {
        "email": [
            "This email address is already in use"
        ],
        "username": [
            "has already been taken"
        ],
        "full_messages": [
            "Email This email address is already in use",
            "Username has already been taken"
        ]
    }
}
```