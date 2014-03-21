ghost-docker
============

Template for setting up a blog that runs in an isolated docker container with ghost and nginx

### How to build it

This assumes you have docker already installed.

Option one:

<code>sudo docker pull dluna/ghost</code>

This pulls the docker build from the docker index

Option two:

Clone this repo and then build the file yourself

<code>sudo docker build -t="yournamehere" .</code>

### How to run

Normal

<code> sudo docker run -d -p 80:80 dluna/ghost # dluna/ghost would be whatever else you named it if you build using option two</code>

If you want to save posts and use custom themes, which in all likelihood you will then you need to provide the directory your custom
directory.

<code> sudo docker run -d -p 80:80 -v <custom-dir>:/ghost-custom dluna/ghost # dluna/ghost would be whatever else you named it if you build using option two</code>

The directory should have the following structure

config.js: This is the custom config file for ghost will override the default one
content/data: This is where the posts will be stored in the db
content/themes: This is where you'll put your themes
content/images: All your images
content/plugins: Ghost plugins

For more info visit the [Ghost Docs](http://docs.ghost.org/)
