Welcome to this course on Server Side Dart! My name is Jonathan. On GitHub and StackOverflow I go by the username Suragch. 

I’m really excited about using Dart on the server. My background is in Android and iOS mobile development. I spent a long time remaking apps in iOS that I had already made for Android. It came to the point that I just didn’t have time to support both versions anymore. So when Flutter was announced I jumped on it. Write the code once and have it work everywhere. That’s amazing! And it’s not just the code base, it’s the language. Having to switch back and forth between different programming languages slows me down. Dart was easy to pick up and now whether I am doing frontend development or backend development, I don’t have to switch languages any more. I really like that.

The subtitle for the course says “Build a Dart Backend for your Flutter App”. The thing about a web API, though, is that the frontend and the backend are completely decoupled. This same server will work for a web app, an Android app, an iOS app, a desktop app . . . . AND a Flutter app. Everything goes through the REST API. So you are totally welcome to take this course even if you don’t plan to do any Flutter development. The nice connection to Flutter, though, is that the Dart language is the same.

This course is meant to be a very practical guide to setting up your own backend server. I’ll walk you through step by step of how to set up a secure, production ready server. We’ll be using the open source Aqueduct framework, which is the most popular Dart server framework on Github.

You’ll get the most out of this course if you follow along with me as I show you what to do in each step. Don’t just watch the videos, but type in the code as we go along. Don’t worry if this is your first time to do backend development. I’ll explain the concepts as we go along. And if you already have experience with backend development in another language, you’ll be up and running with Server Side Dart in no time.

Let me walk through an overview of what we will be covering. During the course we be building a server for a dictionary app. It is real enough to be practical but general enough that you can adapt the concepts to your own specific needs later.

1. Setup Aqueduct
2. Handling HTTP requests
3. Database
4. Testing
5. Authentication
6. Production server
7. Flutter client app


In the first section I’ll help you set up Aqueduct, the framework that we will be using to build our Dart server. That’s be easy. I’m going to assume that you already have Dart and an IDE installed, but I’ll certainly help you with that if you need it. I will be using IntelliJ IDEA for the videos, but I have to say I was really temped to use Visual Studio Code. I’ve used both, and they both work great, so feel free to use whichever one you are more comfortable with.

In the second section, we’ll look at how to handle basic HTTP requests like GET, POST, PUT, and DELETE.

In the third section we’ll connect our HTTP server to a PostgreSQL database. If you haven’t used Postgres before, don’t worry. It’s not that much different than other SQL databases. We don’t even need to deal much SQL code. Aqueduct handles most of it behind the scenes. After we get the database set up, we’ll update the HTTP requests so that they use the database.

In the fourth section I’ll show you how to write tests to verify that our server is behaving as we expect it to.

In the fifth section I’ll show you how to register a user, log them in with their username and password, and manage authorization tokens. These tokens will allow a logged in user the permission to perform the HTTP requests that we made before.

In the sixth section I’ll show you how to move your server app from your local machine to a production server, set up in a secure environment.

Finally, in the last section I’ll walk through making a basic Flutter client app that will connect to our Dart server. This section is optional for people who are not doing Flutter development.

All along the way feel free to ask questions. I’m a teacher at heart and I won’t make fun of you for having a dumb question. I love helping people understand things. If you’re successful, then I am successful. 


