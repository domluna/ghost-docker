ghost-docker
============
Template for setting up a blog that runs in an isolated docker container with ghost and nginx

### How to build it

This assumes you have docker already installed.

Option one:

```sh
$ sudo docker pull dluna/ghost
```

This pulls the docker build from the docker index

Option two:

Clone this repo and then build the file yourself

```sh
$ sudo docker build -t="yournamehere" .
```
### How to run

Normal

```sh
$ sudo docker run -d -p 80:80 dluna/ghost # dluna/ghost would be whatever else you named it if you build using option two
```
If you want to save posts and use custom themes, which in all likelihood you will then you need to provide the directory your custom
directory.

```sh
$ sudo docker run -d -p 80:80 -v your-directory:/ghost-custom dluna/ghost # dluna/ghost would be whatever else you named it if you build using option two
```
The directory should have the following structure

* config.js: This is the custom config file for ghost will override the default one
* content/data: This is where the posts will be stored in the db
* content/themes: This is where you'll put your themes
* content/images: All your images
* content/apps: Ghost apps

For more info visit the [Ghost Docs](http://docs.ghost.org/)
