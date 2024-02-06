# Look at NestJS

In this step I’d like you to create a NestJS application from the official template with strict typescript rules. (Read hints since it’s not a default). The application goal will be the standalone API with authentication. It should be as secure as you can think of :)

```
For the simplicity the app should incorporate SQLite database 
with ORM of your choice.
```

App should have the following features

- Ability to register
    - we want to sign in using email,password
    - additionaly user has additional properties
        - firstName
        - lastName
        - phoneNumber
        - shirtSize
        - preferredTechnology
- Ability to login in
    - Using email and password
- Authentication should be Header-Hased
- Simple /users endpoint returning all users, accessible only after login

Since it’s an API you don’t need to build any frontend/visual logic for that, you can just use API testing tools like Postman, Insomnia, or even just cURL. 
Bonus Points for tests

Good Luck! 🎉
