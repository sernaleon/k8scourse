# Exercise 1.02: Project v0.1

**Project can be done with any language and framework you want**

The project will be a simple todo application with the familiar features of create, read, update, and delete (CRUD). We'll develop it during all parts of this course. Check the title of the exercise for "Project vX.Y" to know it is about building the project.

Todo is a text like "I need to clean the house" that can be in state of not-done or done.

Let's get started!

Create a web server that outputs "Server started in port NNNN" when it is started and deploy it into your Kubernetes cluster. Please make it so that an environment variable PORT can be used to choose that port. You will not have access to the port when it is running in Kuberetes yet. We will configure the access when we get to networking.

## Solution remarks
- API created using ```npx express-generator```.
