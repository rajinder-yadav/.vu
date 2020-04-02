# vu the missing Vue.js CLI 😍

A Vue.js utility for TypeScript projects.

## Setup

How to setup up the script to work on Linux and MacOS.

Clone project under your home folder.

```sh
cd ~
git clone git@github.com:rajinder-yadav/vu.git
```

Next add the code snippet below to "__~/.bashrc__" or "__~/.profile__".

```sh
if [ -f "${HOME}/vu/vu.sh" ]; then
    . "${HOME}/vu/vu.sh"
fi
```

Verify from the terminal, type "__vu__" and press enter.

```sh
$ vu

vu the missing Vue.js CLI 😍

Usage: vu <command> [options]

CMD     Options                 Description
===     =======                 ===========
new     <name>                  Create Vue.js Project.
b                               Production build.
g       c <name>                Generate Component under "components" folder.
g       v <name>                Generate Component under "views" folder.
g       <folder> <name>         Generate Component under declared folder.
s                               Run development Server.
```

## Usage

Creating a new Vue.js project

```sh
vu new hello-world
```

Generating a Component called Dashboard.
Generated code will be place in the subfolder, "src/components/Dashboard".

```sh
vu g c Dashboard
```

Generating a View Component called Home.
Generated code will be place in the subfolder, "src/views/Dashboard".

```sh
vu g v Home
```

Generating a Component called Login under subfolder, "src/Admin/Login".

```sh
vu g Admin Login
```

Starting the development server.

```sh
vu s
```

Doing a production build.

```sh
vu b
```
