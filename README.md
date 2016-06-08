# service-api-app
Service-api micro service

**OAuth2 token endpoint**
----
  Grants access token using password grant type

* **URL**

  /api/oauth/token

* **Method:**

  `POST`
  
*  **URL Params**

    `None`
* **Data Params**

    `grant_type="password"[string]`
    
    `username=[string]`
    
    `password=[string]`
    
    must be sent using `x-www-form-urlencoded`
    
* **Headers**
    
   `Authorization=Basic {client_id:client_secret encoded in base64}`

    example:
    
    `Authorization=Basic c2VydmljZTpzZXJ2aWNlXzEyMzQ=`
* **Success Response:**

   **Code:** 200
   
    **Content:**
    
    ```JSON
    {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwcy8vYXBpLnNlcnZpY2UuamlsbGl4LmNvbSIsInN1YiI6Imh0dHA6Ly9zZXJ2aWNlLmppbGxpeC5jb20vc2VydmljZVVzZXIiLCJpYXQiOjE0NjUzODI3MDk4NDcsImV4cCI6MTQ2NTM4NjMwOTg0N30.AbE1UGgikCDyqkNuQZ_2Fe0nBX21BfrPguec2KECqkk",
        "token_type": "bearer",
        "expires_in": 3600,
        "scope": [
            "service_app"
        ]
    }
    ```
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ```

----
 **User create**
----
    Creates a new user

* **URL**

  /api/users

* **Method:**

  `POST`
  
*  **URL Params**
    
    `none`
* **Data Params**
    
    `username=[string]`

    `email=[string]`

    `password=[string]`

    `verifyPasword=[string]`

* **Success Response:**

   **Code:** 201
   
   **Content:** JSON-LD document containing the created user
   
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 


----
 **User get**
----
  Returns user in JSON-LD form

* **URL**

  /api/users/:username

* **Method:**

  `GET`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be returned
* **Data Params**

    `none`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

   **Code:** 200
   
   **Content:** JSON-LD document containing the user
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 


----
 **User update core properties**
----
    Updates core properties of a user

* **URL**

    /api/users/:username

* **Method:**

    `PATCH`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be updated
* **Data Params**

    `givenName=[string]`

    `familyName=[string]`
    
    `address=[string]`

    `website=[string]`

    `worksFor=[string]`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing the updated user
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **User add email**
----
    Assigns email address to user

* **URL**

    /api/users/:username/emails

* **Method:**

   `POST`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be updated
* **Data Params**


* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

   **Code:** 201
   
    **Content:** The added email address
    
    ```JSON
    {
        "email": "...",
        "active": false,
        "primary": false
    }
    ```
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 


----
 **User update password**
----
   Updates user password field

* **URL**

   /api/users/:username/password

* **Method:**

   `PATCH`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be updated
* **Data Params**

    `oldPassword=[string]`

    `newPassword=[string]`

    `confirmPassword=[string]`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **User update email**
----
    Updates email fields of a user

* **URL**

    /api/users/:username/emails/:emailId

* **Method:**

    `PATCH`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be updated
    `emailId=[string]` - the id of the email that will be updated
* **Data Params**

    `active=[Boolean]`

    `primary=[Boolean]`
* **Headers**
    
    `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 


----
 **User delete**
----
    Deletes user account

* **URL**

   /api/users/:username

* **Method:**

   `DELETE`
  
*  **URL Params**

    `username=[string]` - the username of the user that will be updated
* **Data Params**

    `password=[string]` - the password of the user that will be deleted
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project create**
----
    Creates a new project

* **URL**

   /api/users/:username/projects

* **Method:**

   `POST`
  
*  **URL Params**

    `username=[string]` - The username of the project owner
* **Data Params**

    `name=[string]` - The name of the new project
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 201
   
    **Content:** JSON-LD document containing the created project

 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project get**
----
    Returns project in JSON-LD form

* **URL**

    /api/users/:username/projects/:projectSlug
* **Method:**

    `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name
* **Data Params**


* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

   **Code:** 200
   
    **Content:**
    
    ```JSON
    {
        
    }
    ```
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project list**
----
    Returns user projects in JSON-LD form

* **URL**

   /api/users/:username/projects

* **Method:**

   `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner
* **Data Params**

    `None`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

   **Code:** 200
   
    **Content:** JSON-LD document containing user projects
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project update core**
----
    Updates project core properties

* **URL**

   /api/users/:username/projects/:projectSlug

* **Method:**

   `PATCH`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name
* **Data Params**

    `name=[string]` - The name of the project

    `active=[string]` - The status of the project
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing the updated project


* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ```

----
 **Project grant access**
----
    Grants read, write or owner access rights to a user

* **URL**

   /api/users/:username/projects/:projectSlug/access

* **Method:**

   `POST`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name
* **Data Params**

    `role=[string]` - the access right that the user will receive

    `user=[string]` - the id of the user that will receive the access rights
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project get access**
----
    Returns all users that have access rights to a project

* **URL**

   /api/users/:username/projects/:projectSlug/access?role=:role

* **Method:**

   `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `role=[string]` - optional filtering param. Returns only users with the specified role
* **Data Params**

    `None`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing users with access rights
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **Project delete**
----
    Deletes project

* **URL**

   /api/users/:username/projects/:projectSlug

* **Method:**

   `DELETE`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name
* **Data Params**

    `name=[string]` - the name of the project that will be deleted
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 


----
 **App create**
----
    Creates a new app

* **URL**

   /api/users/:username/projects/:projectSlug/apps

* **Method:**

   `POST`
  
*  **URL Params**

    `username=[string]` - The username of the project owner

    `projectSlug=[string]` - the slug created from the project name
* **Data Params**

    `name=[string]` - The name of the new app
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 201
   
    **Content:** JSON-LD document containing the created app
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **App get**
----
    Returns app in JSON-LD form

* **URL**

    /api/users/:username/projects/:projectSlug/apps/:appSlug
* **Method:**

    `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `appSlug=[string]` - the slug created from the app name
* **Data Params**


* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containg app data
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **App list**
----
    Returns all apps from a project that the user has access to

* **URL**

   /api/users/:username/projects/:projectSlug/apps

* **Method:**

   `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

* **Data Params**

    `None`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing user apps
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ```

----
 **App list all**
----
    Returns all the apps a user has access to

* **URL**

   /api/users/:username/apps

* **Method:**

   `GET`
  
*  **URL Params**

    `username=[string]` - the username of the app owner

* **Data Params**

    `None`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing user apps
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **App update core**
----
    Updates app core properties

* **URL**

   /api/users/:username/projects/:projectSlug/apps/:appSlug

* **Method:**

   `PATCH`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `appSlug=[string]` - the slug created from the app name 
* **Data Params**

    `name=[string]` - The name of the app

* **Headers**
    
    `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing the updated app


* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ```

----
 **App grant access**
----
    Grants read, write or owner access rights to a user

* **URL**

   /api/users/:username/projects/:projectSlug/apps/:appSlug/access

* **Method:**

   `POST`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `appSlug=[string]` - the slug created from the app name 
* **Data Params**

    `role=[string]` - the access right that the user will receive

    `user=[string]` - the id of the user that will receive the access rights
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
 
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **App get access**
----
    Returns all users that have access rights to am app

* **URL**

   /api/users/:username/projects/:projectSlug/apps/:appSlug/access

* **Method:**

   `GET`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `appSlug=[string]` - the slug created from the app name 

    `role=[string]` - optional filtering param. Returns only users with the specified role
* **Data Params**

    `None`
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 200
   
    **Content:** JSON-LD document containing users with access rights
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 

----
 **App delete**
----
    Deletes app

* **URL**

   /api/users/:username/projects/:projectSlug/apps/:appSlug

* **Method:**

   `DELETE`
  
*  **URL Params**

    `username=[string]` - the username of the project owner

    `projectSlug=[string]` - the slug created from the project name

    `appSlug=[string]` - the slug created from the app name    
* **Data Params**

    `name=[string]` - the name of the app that will be deleted
* **Headers**
    
   `Authorization=Bearer {token provided by the oauth2 endpoint}`

    example:
    
    `Authorization=Bearer eyJhbGci...X21BfrPguec2KECqkk`
* **Success Response:**

    **Code:** 204
   
    **Content:** None
* **Error Response:**

    **Code:** {HTTP_STATUS_CODE}

    `400` - if the data provided is inccorect

    `401` - if the access token is not valid

    `403` if the user using this api does not have access to this resource

    `404` if the resource does not exist
    
    **Content:**
    
    ```JSON
    {
        "code": {HTTP_STATUS_CODE},
        "message": {ERROR_MESSAGE},
        "name": {ERROR_TYPE}
    }
    ``` 