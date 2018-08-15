#!/bin/bash

message () {
  echo -e "\033[0;32m$1\033[0m"
}

DIR=$(find ./ -maxdepth 1 -type d -printf "%f ")
CURR=$(pwd)

FETCH=$(echo "$1 $2 $3" | grep "\-fetch")
INTERACTIVE=$(echo "$1 $2 $3" | grep "\-interactive")

for f in $DIR
do
	if [ ! "%f" == "./" ]  && [ ! "%f" == "../" ]; then
		cd $f
		if [ -e .git ]; then
			if [ ! "$FETCH" == "" ]; then
				git fetch origin master > /dev/null
			fi
			RES=$(git status | grep "	")
			if [ ! "$RES" == "" ]; then
				message "**** $f : for commit **********"
				echo "$RES"
				if [ ! "$INTERACTIVE" == "" ]; then
					echo "-------------------------------"
					echo "Commit message [Empty to cancel]: "
					read COMMIT_MESSAGE
					if [ ! "$COMMIT_MESSAGE" == "" ]; then
						git add -A
						git commit -m "$COMMIT_MESSAGE"
					fi
				fi
				sleep 1
			fi
			RES1=$(git status | grep "Your branch is ahead")
			if [ ! "$RES1" == "" ] ; then
				message "**** $f : for push   **********"
				echo "$RES1"
				if [ ! "$INTERACTIVE" == "" ]; then
					echo "-------------------------------"
					echo "Push to origin [ Empty to cancel ] ? :"
					read PUSH_ORIGIN
					if [ ! "$PUSH_ORIGIN" == "" ]&& [ ! "$INTERACTIVE" == "" ]; then
						git push origin $PUSH_ORIGIN
					fi
				fi
				sleep 1
			fi
		fi
		cd $CURR
	fi
done
