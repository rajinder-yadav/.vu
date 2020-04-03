# vu the missing Vue.js CLI 😍

A Vue.js utility for TypeScript projects.

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [vu the missing Vue.js CLI 😍](#vu-the-missing-vuejs-cli)
  - [Setup](#setup)
    - [Verifing](#verifing)
  - [Setting up manually](#setting-up-manually)
  - [Usage](#usage)
    - [Create a Project](#create-a-project)
    - [Generate a Component](#generate-a-component)
    - [Generate a View Component](#generate-a-view-component)
    - [Generate Component in another folder](#generate-component-in-another-folder)
    - [Run dev Server](#run-dev-server)
    - [Build release](#build-release)

<!-- /code_chunk_output -->

## Setup

```sh
curl https://raw.githubusercontent.com/rajinder-yadav/.vu/master/vu-setup.sh -o vu-setup.sh; bash ./vu-setup.sh
```

### Verifing

From the terminal, type "__vu__" and press enter.

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

How to setup up the script to work on Linux and MacOS manually.

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

Creating a new Vue.js project "hello-world".

```sh
vu new hello-world
```

### Generate a Component

Generating a Component called Dashboard.
Generated code will be place in the subfolder, "src/components/Dashboard".

```sh
vu g c Dashboard
```

### Generate a View Component

Generating a View Component called Home.
Generated code will be place in the subfolder, "src/views/Dashboard".

```sh
vu g v Home
```

### Generate Component in another folder

Generating a Component called Login under subfolder, "src/Admin/Login".

```sh
vu g Admin Login
```

### Run dev Server

Starting the development server.

```sh
vu s
```

### Build release

Doing a production build.

```sh
vu b
```
