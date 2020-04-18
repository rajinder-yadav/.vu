# The missing Vue.js CLI for TypeScript 😍

A Vue.js utility for TypeScript projects.

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [The missing Vue.js CLI for TypeScript 😍](#the-missing-vuejs-cli-for-typescript)
  - [Introduction](#introduction)
    - [Customizable code generation](#customizable-code-generation)
  - [Installing](#installing)
    - [Verifying](#verifying)
  - [Setting up manually](#setting-up-manually)
  - [Commands](#commands)
  - [Usage](#usage)
    - [Add Plugin](#add-plugin)
    - [Build release](#build-release)
    - [Generate a Component](#generate-a-component)
    - [Generate a View Component](#generate-a-view-component)
    - [Generate Component in another folder](#generate-component-in-another-folder)
    - [Create a Project](#create-a-project)
      - [Tip: Deselect Babel](#tip-deselect-babel)
    - [Run dev Server](#run-dev-server)
    - [Run UI Server](#run-ui-server)
    - [Show Version](#show-version)
    - [Upgrading vu](#upgrading-vu)
    - [Customizing generated code](#customizing-generated-code)
      - [Template files](#template-files)
      - [Template variable](#template-variable)

<!-- /code_chunk_output -->

## Introduction

If you're like me and code Vue.js using TypeScript, then you will find using "__vu__" will boost your productivity. It adds "sane" convenience shortcuts and generates codes like Angular CLI.

The Problem

- The Vue CLI puts everything into a single file and fails to generate code.

So I got tired of creating the files and sub-folder manually and then using snippets to generate the source code. This is when "vu" was born, it does all this with easy to use commands.

The Fix

- Separation of concern is a smart design choice, it is cleaner as the code grows.
- Create separate files for Component Class, Template and Styles.
  - Co-locate Component files under their own subfolder.
- Generate files and skeleton code, code snippets are good but gets repetitive.

![image](images/folder.png)

### Customizable code generation

If the default generated code does not work for you, you can eject their templates and modify to suite you own needs. See [Customizing generated code](#customizing-generated-code) for more details.

Vue CLI is not enough, so I coded a Bash script to extend it, this turned into the "vu" CLI.
If you find it useful, let me know on twitter.

You can follow me: [@dev_mentor](https://twitter.com/dev_mentor)

## Installing

Before running the install script below, make sure you have the following installed:

1. Node.js
1. Git

Run the following multi-line command in your Terminal.

```sh
curl https://raw.githubusercontent.com/rajinder-yadav/.vu/master/vu-setup.sh \
-o vu-setup.sh; bash ./vu-setup.sh
```

### Verifying

From the Terminal, type "__vu__" and press enter. You should see the following output.

```pre
$ vu

The missing Vue.js CLI for TypeScript 😍 (v1.11.0)

Usage: vu <command> [options]

CMD      Options           Description
===      =======           ===========
add                        Install Plugin
b                          Production build

g        c <name>          Generate Component under "components" folder
g        v <name>          Generate Component under "views" folder
g        <folder> <name>   Generate Component under declared folder

n|new    <name>            Create Vue.js Project
s                          Run development Server
ui                         Run Vue UI
v                          Show version

eject                      Eject code generation Templates
upgrade                    Upgrade vu script
```

## Setting up manually

If you some reason the setup command above failed. Here is how to setup up the script to work on Linux and MacOS manually.

Clone project "__vu__" under your home folder.

```sh
cd ~
git clone https://github.com/rajinder-yadav/vu.git ${HOME}/.vu
```

Next add the code snippet below to "__~/.bashrc__" or "__~/.bash_profile__".

```sh
# Enable vu CLI script for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
```

The "__vu__" CLI makes use of Vue.js CLI to create a new project, make sure to install it.

```sh
npm install -g @vue/cli
```

## Commands

Syntax: __vu \<command> [options]__

Description|Command|Operation
-|-|-
[Add](#add-plugin)|add|Install Plugin
[Build](#build-release)|__b__|Production build.
Generate|__g__|Generate Code in a sub-folder.
[Generate Component](#generate-a-component)|__g c__|Code placed under "__components__" sub-folder.
[Generate View](#generate-a-view-component)|__g v__|Code placed under "__views__" sub-folder.
[Generate sub-folder](#generate-component-in-another-folder)|__g \<folder>__|Code placed under "__\<folder>__" sub-folder.
[New](#create-a-project)|__n \| new__|Create and new project.
[Server](#run-dev-server)|__s__|Start development server.
[Version](#show-version)|__v__|Display version.
[eject](#customizing-generated-code)|__eject__|Eject code generation Templatess.
[upgrade](#upgrading-vu)|__upgrade__|Update vu CLI.

## Usage

You can for the most part work with the vu CLI exclusively.

### Add Plugin

```sh
vu add <plugin>
```

### Build release

Create a production build to deployment.

```sh
vu b
```

### Generate a Component

Generate a Component called Dashboard.
The generated code is placed in the subfolder, "__src/components/Dashboard__".

```sh
vu g c Dashboard
```

The output to the Terminal should looks like:

```sh
=> Creating Component folder.
=> Creating Component files.
  => Created: ./src/components/Dashboard/Dashboard.ts
  => Created: ./src/components/Dashboard/Dashboard.vue
  => Created: ./src/components/Dashboard/Dashboard.stylus
```

A check will be made before creating the folder and files, if the folder exist  the following error is displayed.

```sh
=> WARNING: Component folder exist, no operation was performed.
```

### Generate a View Component

Generate a View Component called Home.
The generated code is placed in the subfolder, "__src/views/Home__".

```sh
vu g v Home
```

The output to the Terminal should looks like:

```sh
=> Creating Component folder.
=> Creating Component files.
  => Created: ./src/views/Home/Home.ts
  => Created: ./src/views/Home/Home.vue
  => Created: ./src/views/Home/Home.stylus
```

A check will be made before creating the folder and files, if the folder exist  the following error is displayed.

```sh
=> WARNING: Component folder exist, no operation was performed.
```

### Generate Component in another folder

Generate a Component called Login under subfolder, "__src/Admin/Login__".

```sh
vu g Admin Login
```

The output to the Terminal should looks like:

```sh
=> Creating Component folder.
=> Creating Component files.
  => Created: ./src/Admin/Login/Login.ts
  => Created: ./src/Admin/Login/Login.vue
  => Created: ./src/Admin/Login/Login.stylus
```

A check will be made before creating the folder and files, if the folder exist  the following error is displayed.

```sh
=> WARNING: Component folder exist, no operation was performed.
```

### Create a Project

Create a new Vue.js project named "hello-world".

```sh
vu new hello-world
```

OR

```sh
vu n hello-world
```

Once the project has been created, you will automatically be placed inside the new project root folder "hello-world.

#### Tip: Deselect Babel

When creating a TypeScript project, deselect Bable and just select Typescript from the CLI prompt. Using Bable with Bable plugins for TypeScript is not TypeScript.

There is no advantage using both, since TypeScript is a super-set of ECMAScript and future proof.

![image](images/vue-ts.png)

### Run dev Server

Start the development server.

```sh
vu s
```

You can now view the Vue.js Website at "http://localhost:8080/".

### Run UI Server

Starts the Vue.js UI server.

```sh
vu ui
```

This will open default Web Browser with URL "http://localhost:8000/dashboard".

### Show Version

Display vu CLI version.

```sh
vu v
```

### Upgrading vu

This will update the vu CLI.

```sh
vu upgrade
```

For the new update to take effect, you will need to refresh the Bash shell.

Pay attention to the output on how to do this, or just open a new Terminal.

```sh
=> Update Bash shell with, "source /home/yadav/.vu/vu.sh"
```

### Customizing generated code

To customize code generation, you must first eject the template files.

```sh
vu eject
```

The ejected template files can be found under the subfolder "__.vurc__", located under your home folder.

The output to the Terminal should looks like:

```sh
=> Creating Template folder
=> Creating Template files
  => /home/yadav/.vurc/component.vu
  => /home/yadav/.vurc/style.vu
  => /home/yadav/.vurc/template.vu
=> SUCCESS: Template files ejected folder: /home/yadav/.vurc
=> Make your custom change in these files.
=> Delete this folder to return to using the defaults.
```

#### Template files

There are 3 files, whatever you place inside will show up in the generated code.

- component.vu
- template.vu
- style.vu

If you want to return to using the default generated file, just delete the above mentioned files or delete the "__.vurc__" subfolder.

#### Template variable

There are currently two variables, who are substitued with their value.

Variable|Meaning
-|-
COMPONENT_NAME|Name of the Component.
CSS_EXT|File extension for the CSS style file.
