#!/bin/bash

message () {
  echo -e "\033[0;32m$1\033[0m"
}

DIR=$(find ./ -maxdepth 1 -type d -printf "%f ")
CURR=$(pwd)

for f in $DIR
do
	if [ ! "%f" == "./" ]  && [ ! "%f" == "../" ]; then
		cd $f
		if [ -e .git ]; then
			RES=$(git status | grep "	")
			if [ ! "$RES" == "" ]; then
				echo "**** $f : for commit **********"
				echo "-------------------------------"
				echo "$RES"
				echo "Commit message [Empty to cancel]: "
				read COMMIT_MESSAGE
				if [ ! "$COMMIT_MESSAGE" == "" ]; then
					git add -A
					git commit -m "$COMMIT_MESSAGE"
				fi
				sleep 1
			fi
			RES1=$(git status | grep "Your branch is ahead")
			if [ ! "$RES1" == "" ]; then
				echo "**** $f : for push   **********"
				echo "$RES1"
				echo "-------------------------------"
				echo "Push to origin [ Empry to cancel ] ? : "
				read PUSH_ORIGIN
				if [ ! "$PUSH_ORIGIN" == "" ]; then
					git push origin $PUSH_ORIGIN
				fi
				sleep 1
			fi
		fi
		cd $CURR
	fi
done
