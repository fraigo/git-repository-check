# git-repository-check
Check script to review git repositories (Pending commit, and push)

# Usage

## Download and install script

```bash
curl -s https://fraigo.github.io/git-repository-check/git-check.sh > gitcheck
sudo install -m 755 gitcheck /usr/bin/gitcheck
```

## Run the command

```bash
gitcheck
```

This command will check every folder inside the current working directory, searching for a pending commit locally, or push to a remote server.

### Quick commit

If some repository has files to **commit**, it will request for a commit message. Leave empty (press enter) to continue without commit.


```
**** project-quick-start : for commit **********
	modified:   package.json
	npm-debug.log
	yarn.lock
-------------------------------
Commit message [Empty to cancel]: 
```

### Quick push

If some repository has commits to **push**, it will ask to the push origin. Leave empty (press enter) to continue without commit.

```
**** project-quick-start : for push   **********
Your branch is ahead of 'origin/master' by 1 commit.
-------------------------------
Push to origin [ (y)es , empty to cancel ] ? :
```
