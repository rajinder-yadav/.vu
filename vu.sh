#=============================================================================================
# Vue.js Utility Script - The missing Vue.js CLI
#
# Author: Rajinder Yadav
# Date: March 28, 2020
# Licence: MIT
# Version: 1.10.1
#
# Github: https://github.com/rajinder-yadav/vu
#=============================================================================================
IDE="/usr/bin/code-insiders"
WARN_ON='\033[1;33m'
HILIGHT_ON='\033[0;32m'
HILIGHT_OFF='\033[0m' # No Color

# export CLI_CWD=$(pwd)

function vu() {

  if [ -d "src" ]; then
    CSS_EXT=$(grep -Po '<style\slang="\K\w*' src/App.vue)
  fi

  if [ -z "$CSS_EXT" ]; then
    # Fallback style type.
    CSS_EXT="stylus"
  fi

  case ${1} in

    # Command: add
    add)
      if [ ${2} ];  then
        vue add ${2}
      else
        printf "${WARN_ON}"
        printf "=> NPM module is required.\n"
        printf "${HILIGHT_ON}"
      fi
    ;;

    # Command: build
    b)
      npm run build
    ;;

    # Command: eject
    eject)
      EJECT="yes"
      if [ -d ${HOME}/.vurc ]; then
        printf "${WARN_ON}"
        printf "=> WARNING: Template folder exists.\n"
        printf "=> WARNING: Ejecting will destory old changes.\n"
        read -r -p "Do you want to continue? [y/N] " response
        case ${response} in
          [yY][eE][sS]|[yY])
            EJECT="yes"
            ;;
          *)
            EJECT="no"
            printf "=> Eject operation cancelled.\n"
            ;;
        esac
        printf "${HILIGHT_OFF}"
      fi

      if [ ${EJECT} == "yes" ]; then
        cp -r ${HOME}/.vu/templates ${HOME}/.vurc
        printf "${HILIGHT_ON}"
        printf "=> Creating Template folder\n"
        printf "=> Creating Template files\n"
        printf "  => ${HOME}/.vurc/component.vu\n"
        printf "  => ${HOME}/.vurc/style.vu\n"
        printf "  => ${HOME}/.vurc/template.vu\n"
        printf "=> SUCCESS: Template files ejected folder: ${HOME}/.vurc\n"
        printf "=> Make your custom change in these files.\n"
        printf "=> Delete this folder to return to using the defaults.\n"
        printf "${HILIGHT_OFF}"
      fi
    ;;

    # Command: new
    n|new)
      if [ ! -d ${2} ]; then
        # Create a new project.
        vue create ${2}
        cd ${2}

        # Need to get this working to open vscode with project.
        # "`${IDE}` $CLI_CWD/$2"
      else
        printf "${WARN_ON}"
        printf "=> WARNING: Folder exist! Failed to create Project.\n"
        printf "${HILIGHT_OFF}"
      fi
    ;;

    # Command: generate
    g)
      if [ "$#" -lt 3 ]; then
        ShowUsage
      else
        case ${2} in
          # Option: component
          c)
            # Use default components folder.
            GenerateComponent "components" ${3} ${CSS_EXT}
          ;;

          # Option: view
          v)
            # Use default components folder.
            GenerateComponent "views" ${3} ${CSS_EXT}
          ;;

          # Default: Use specified folder for code generation.
          *)
            # Folder & Component name provided.
            GenerateComponent ${2} ${3} ${CSS_EXT}
          ;;
        esac
      fi
    ;;


    # Command: server
    s)
      # Run development server.
      npm run serve
    ;;

    # Command: upgrade
    upgrade)
      # Upgrade vu script.
      pushd ${HOME}/.vu &> /dev/null
      git pull
      popd &> /dev/null
      printf "${HILIGHT_ON}"
      printf "=> Update Bash shell with, \"source ${HOME}/.vu/vu.sh\"\n"
      printf "${HILIGHT_OFF}"
    ;;

    # Command: version
    v)
      echo "v1.10.1"
    ;;

    # Default: Show usage help text.
    *)
      ShowUsage
    ;;

  esac
}


function ShowUsage() {
  # Show usage help.
  printf "${HILIGHT_ON}"
  printf "\nThe missing Vue.js CLI for TypeScript 😍 (v1.10.1)\n\n"
  printf "Usage: vu <command> [options]\n\n"
  printf "CMD      Options           Description\n"
  printf "===      =======           ===========\n"
  printf "add                        Install a Plugin\n"
  printf "b                          Production build\n\n"
  printf "g        c <name>          Generate Component under \"components\" folder\n"
  printf "g        v <name>          Generate Component under \"views\" folder\n"
  printf "g        <folder> <name>   Generate Component under declared folder\n\n"
  printf "n|new    <name>            Create Vue.js Project\n"
  printf "s                          Run development Server\n"
  printf "v                          Show version\n\n"
  printf "eject                      Eject code generation Templates\n"
  printf "upgrade                    Upgrade vu script\n\n"
  printf "${HILIGHT_OFF}"
}


function GenerateComponent() {
  # Creat Component.
  # Default Component folder.
  FOLDER=${1}
  COMPONENT_NAME=${2}
  CSS_EXT=${3}

  if [ ! -d ./src/${FOLDER}/${COMPONENT_NAME} ]; then
    printf "${HILIGHT_ON}"
    printf "=> Creating Component folder.\n"
    mkdir -p ./src/${FOLDER}/${COMPONENT_NAME}
    printf "=> Creating Component files.\n"
    printf "${HILIGHT_OFF}"

    GenerateClassFile ${FOLDER} ${COMPONENT_NAME} ${CSS_EXT}
    GenerateTemplateFile ${FOLDER} ${COMPONENT_NAME} ${CSS_EXT}
    GenerateStyleFile ${FOLDER} ${COMPONENT_NAME} ${CSS_EXT}
  else
    printf "${WARN_ON}"
    printf "=> WARNING: Component folder exist, no operation was performed.\n"
    printf "${HILIGHT_OFF}"
  fi
}


function GenerateClassFile() {
  FOLDER=${1}
  COMPONENT_NAME=${2}
  CSS_EXT=${3}

  # Generate Class file.
  if [[ -d ${HOME}/.vurc && -f ${HOME}/.vurc/component.vu ]]; then
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vurc/component.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.ts
  else
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vu/templates/component.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.ts
  fi

  printf "${HILIGHT_ON}"
  printf "  => Created: ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.ts\n"
  printf "${HILIGHT_OFF}"
}


function GenerateTemplateFile() {
  FOLDER=${1}
  COMPONENT_NAME=${2}
  CSS_EXT=${3}

  # Generate Template file.
  if [[ -d ${HOME}/.vurc && -f ${HOME}/.vurc/template.vu ]]; then
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vurc/template.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.vue
  else
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vu/templates/template.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.vue
  fi

  printf "${HILIGHT_ON}"
  printf "  => Created: ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.vue\n"
  printf "${HILIGHT_OFF}"
}


function GenerateStyleFile() {
  FOLDER=${1}
  COMPONENT_NAME=${2}
  CSS_EXT=${3}

  # Generate Style file.
  if [[ -d ${HOME}/.vurc && -f ${HOME}/.vurc/style.vu ]]; then
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vurc/style.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.${CSS_EXT}
  else
    FOLDER=${1} COMPONENT_NAME=${2} CSS_EXT=${3} envsubst < ${HOME}/.vu/templates/style.vu > ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.${CSS_EXT}
  fi

  printf "${HILIGHT_ON}"
  printf "  => Created: ./src/${FOLDER}/${COMPONENT_NAME}/${COMPONENT_NAME}.${CSS_EXT}\n"
  printf "${HILIGHT_OFF}"
}
