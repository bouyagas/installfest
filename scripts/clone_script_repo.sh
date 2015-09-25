# ------------------------------------------------------------------------------
# Clone the script repo locally in order to copy dotfiles etc. directly from it.
# (clone_script_repo.sh)
# ------------------------------------------------------------------------------

# TODO (PJ) this needs to be more robust, BY FAR!
SETTINGS=$SRC_DIR/settings
INSTALL_REPO=https://github.com/GA-WDI/installfest_script.git
BRANCH=dtla-06

pause_awhile "Downloading the Installfest repo..."
# download the repo for the absolute paths

if [[ $os_version == *10.6** ]]; then
  # 10.6 doesn't have git so download the zip and rename it installfest
  curl -LO https://github.com/ga-instructors/installfest_script/archive/$BRANCH.zip
  unzip $BRANCH.zip -d ~/.wdi
  mv ~/.wdi/installfest_script-$BRANCH/ ~/.wdi/installfest
else
  if [[ ! -d $SRC_DIR ]]; then
    echo 'Downloading Installfest repo...'
    # autoupdate bootstrap file
    git clone -b $BRANCH $INSTALL_REPO $SRC_DIR
  else
    # update repo
    echo 'Updating repo...'
    cd $SRC_DIR
    git pull origin $BRANCH
  fi
fi