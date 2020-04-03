# vu the missing Vue.js CLI 😍

A Vue.js utility for TypeScript projects.

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [vu the missing Vue.js CLI 😍](#vu-the-missing-vuejs-cli)
  - [Introduction](#introduction)
  - [Setup](#setup)
    - [Verifying](#verifying)
  - [Setting up manually](#setting-up-manually)
  - [Usage](#usage)
    - [Create a Project](#create-a-project)
    - [Generate a Component](#generate-a-component)
    - [Generate a View Component](#generate-a-view-component)
    - [Generate Component in another folder](#generate-component-in-another-folder)
    - [Run dev Server](#run-dev-server)
    - [Build release](#build-release)

<!-- /code_chunk_output -->

## Introduction

If you're like me and code Vue.js using TypeScript, then you will find using "__vu__" will boost your productivity. It adds some convenience sane shortcuts and generates codes like Angular CLI.

I dislike everything in one single file. Seperation of concern is a better design choice, it is cleaner as the code grows.

I place Code for the Component Class, Template and Style in their own separate files.

I got tired of creating the files and sub-folder manually and then using snippets to generate the source code. This is when "vu" was born, it does all this with easy to use commands.

![image](images/folder.png)

Vue CLI is not enough, so I coded a Bash script to extend it, this turned into "vu".
If you find it useful, let me know on twitter.

You can follow me: [@dev_mentor](https://twitter.com/dev_mentor)

__Setup TIP__

When creating a TypeScript project, unselect Bable and just choose Typescript from the CLI prompt. Using Bable with Bable plugins for TypeScript is not TypeScript.

There is no advantage since TypeScript is a superset of ECMAScript and future proof.

![image](images/vue-ts.png)

## Setup

Run the following multi-line command in your terminal.

```sh
curl https://raw.githubusercontent.com/rajinder-yadav/.vu/master/vu-setup.sh \
-o vu-setup.sh; bash ./vu-setup.sh
```

The "__vu__" CLI make use of Vue.js CLI to create a new project, make sure to install it.

Using NPM:

```sh
npm install -g @vue/cli
```

Using YARN:

```sh
yarn global add @vue/cli
```

### Verifying

From the terminal, type "__vu__" and press enter. You should see the following output.

```sh
$ vu

vu the missing Vue.js CLI 😍 (v1.6.3)

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

## Setting up manually

If you some reason the setup command above failed. Here is how to setup up the script to work on Linux and MacOS manually.

Clone project under your home folder.

```sh
cd ~
git clone git@github.com:rajinder-yadav/.vu.git
```

Next add the code snippet below to "__~/.bashrc__" or "__~/.profile__".

```sh
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
```

## Usage

### Create a Project

- Creating a new Vue.js project "hello-world".

```sh
vu new hello-world
```

### Generate a Component

- Generating a Component called Dashboard.
- Generated code will be place in the subfolder, "src/components/Dashboard".

```sh
vu g c Dashboard
```

### Generate a View Component

- Generating a View Component called Home.
- Generated code will be place in the subfolder, "src/views/Dashboard".

```sh
vu g v Home
```

### Generate Component in another folder

- Generating a Component called Login under subfolder, "src/Admin/Login".

```sh
vu g Admin Login
```

### Run dev Server

- Starting the development server.

```sh
vu s
```

### Build release

- Doing a production build.

```sh
vu b
```
