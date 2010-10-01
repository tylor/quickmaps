#!/bin/bash
#
# This command expects to be run within the Open Atrium profile directory. To
# generate a full distribution you it must be a CVS checkout.
#
# To use this command you must have `drush make`, `cvs` and `git` installed.
#

# Script from: http://drupalcode.org/viewvc/drupal/contributions/profiles/openatrium/rebuild.sh?view=log

if [ -f quickmaps.make ]; then
  echo -e "\nThis command can be used to run quickmaps.make in place, or to generate"
  echo -e "a complete distribution of Quickmaps.\n\nWhich would you like?"
  echo "  [1] Rebuild Quickmaps in place."
  echo "  [2] Build a full Quickmaps distribution"
  echo -e "Selection: \c"
  read SELECTION

  if [ $SELECTION = "1" ]; then

    # Run quickmaps.make only.
    echo "Building Open Atrium install profile..."
    drush make --working-copy --no-core --contrib-destination=. quickmaps.make

  elif [ $SELECTION = "2" ]; then

    # Generate a complete tar.gz of Drupal + Open Atrium.
    echo "Building Quickmaps distribution..."

MAKE=$(cat <<EOF
core = "6.x"\n
projects[drupal][version] = "6.19"\n
projects[openatrium][type] = "profile"\n
projects[openatrium][download][type] = "cvs"\n
projects[openatrium][download][module] = "contributions/profiles/openatrium"\n
projects[openatrium][download][revision] =
EOF
)

    TAG=`cvs status openatrium.make | grep "Sticky Tag:" | awk '{print $3}'`
    if [ -n $TAG ]; then
      if [ $TAG = "(none)" ]; then
        TAG="HEAD"
        VERSION="head"
      elif [ $TAG = "HEAD" ]; then
        VERSION="head"
      else
        VERSION="${TAG:10}"
      fi
      MAKE="$MAKE $TAG\n"
      NAME=`echo "atrium-$VERSION" | tr '[:upper:]' '[:lower:]'`
      echo -e $MAKE | drush make --yes --tar - $NAME
    else
      echo 'Could not determine CVS tag. Is openatium.make a CVS checkout?'
    fi
  else
   echo "Invalid selection."
  fi
else
  echo 'Could not locate file "openatrium.make"'
fi