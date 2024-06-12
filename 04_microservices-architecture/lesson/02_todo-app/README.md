# Part 1: Preparation

**Step 1:** Open Terminal/CMD on your computer, navigate to the desired directory, then **clone** the following [repository](https://github.com/kandlagifari/microservices-labs/tree/todo-app) (in the **todo-app** branch).

**Step 2:** Open **Visual Studio Code**, click **File -> Open Folder…**, select the **microservices-labs** folder that you cloned, click the **Open** button.

**Step 3:** Next, create a **Dockerfile** file (without extension) which will later be used to build the image. Copy the following lines of code to the Dockerfile.
```Dockerfile
FROM node:12-alpine

RUN apk add --no-cache python2 g++ make

WORKDIR /app

COPY . .

RUN yarn install --production

CMD ["node", "src/index.js"]

EXPOSE 3000
```

The following is an explanation of each line of the Dockerfile.
- **FROM node:12-alpine:** Docker will download/fetch a base image named node from Docker Hub with the tag **12-alpine**. If it has been downloaded before, Docker will fetch it from local.
- **RUN apk add --no-cache python2 g++ make:** We install several packages such as python2, g++, and make.
- **WORKDIR /app:** We create a new directory called app inside the container and make it the *working directory*. That way, whatever instructions we write in the next line, will be executed in this /app directory.
- **COPY . .:** The first dot indicates the source, while the second dot indicates the *destination*. That means, we copy all the files in the current local working directory (for example, **/home/sleepingknight/microservices-labs** which contains two folders: spec and src; as well as three files: Dockerfile, package.json, and yarn.lock) to the container working directory (i.e., **/app**).
- **RUN yarn install --production:** We run the **yarn install --production** command to install various dependencies required by the Todo App application in the production environment (in addition to the **devDependecies** section in the package.json file).
- **CMD ["node", "src/index.js"]:** We execute the command to run the Todo App application, namely **["node", "src/index.js"]** which means **node src/index.js** when in the shell.
- **EXPOSE 3000:** Because in the **src/index.js** file we specified that the application runs on port 3000, here we also expose the port that will be used by the container, namely **3000**.

**Step 4:** Once you understand the contents of the Dockerfile, don't forget to save it with **CTRL+S**. 

**Step 5:** Then, open a terminal in Visual Studio Code by selecting **Terminal -> New Terminal**. You will be immediately directed to the current *working directory*.

**Step 6:** Now, build a Docker image using the previously created Dockerfile with the name **todo-app** and the **v1** tag.
```shell
docker build -t todo-app:v1 .
```

**Step 7:** OK, now we have a Docker image on local. Let's run a container from the image.
```shell
docker run -dp 30002:3000 --name todo-app todo-app:v1
```

In the command above, we run the new container in **detach mode** (running in the background), create a **port mapping** between **port 30002 on the host** and **port 3000 on the container**, give it the name **todo-app**, and use the image **todo-app:v1**.

![Alt text](pics/01_build-run.png)

**Step 8:** Next, open the address http://{{Public-IP}}:30002/ in a web browser. Soon, the Todo App will appear there.

**Step 9:** Please add some items you want. You can also check an item to mark it as complete or press the red trash icon to delete it.
