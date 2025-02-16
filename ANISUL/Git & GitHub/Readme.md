## Use cases and difference between Git and GitHub

| GitHub                                 | Git                                 |
| -------------------------------------- | ----------------------------------- |
| Service                                | Tool/software                       |
| Cloud-based                            | Local-based                         |
| Host git repository/folder/source code | Change control, version control     |
| Provide GUI interface                  | Provide CLI(Command Line Interface) |
| Maintain on cloud/web                  | Installed and maintained locally    |

## Terminal commands of Windows and Mac

- For working directory - `pwd`
- For listing files and folders - `ls`/`dir`
- For creating a new directory - `mkdir` `directory_name`
- For changing directory - `cd` `directory_name`
- For previous directory - `cd..`
- For deleting a file - `rm` `file_name`
- For force delete use - `del /f` `directory`
- For adding content to file - `echo` `"content" > filename.extension`
- For read file content - `cat` `filename.extension`
- For clear terminal - `clear`
- **_More commands_**
  - For deleting a directory - `rmdir` `directory_name` or `rm -r` `dir_name` or `rmdir /s /q` `dir_name/full_path`
  - For moving a file - `mv` `file_name` `directory_name`
  - For creating a new file - `touch` `file_name`
  - For copying a file - `cp` `file_name` `directory_name`
  - For creating a new file - `echo` `file_name` `file_content`

## Git installation

- Download Links:
  - [Git installation for Windows](https://git-scm.com/download/win)
  - [Git installation for Mac](https://git-scm.com/download/mac)
  - [Git installation for Linux](https://git-scm.com/download/linux)
- Configure git:
  - `git config --global user.name` `"user-name"`
  - `git config --global user.email` `"user-email"`
  - `git config --list`
  - user-name/email is not given then it shows previous value and `--global` for all folders/repositories same user config will be applied if `--global` not being used for system for multiple user on single system
  - `git config` `--global`/`--local`/`--system` `--list` - three type config list
  - `git config` `--global` `--unset` `user.name` - unset value

## SSH key?

- SSH key is a public and private key pair that is used to authenticate with Git and GitHub.
- To generate a public/private rsa key pair - `ssh-keygen -o -t rsa -C` `user@email.com`
- To use key:
  - copy public key
  - paste in GitHub account settings
    - SSH and GPG keys
    - new SSH key
  - provide a title and paste key then ready to go

## Add files in staging area

- working directory/workspace

  - folder/directory create -> `mkdir notes`
  - `cd notes`
  - file create -> `touch day1.txt day2.txt`
  - file content add -> `echo "hello world" > day1.txt or open day1.txt`
  - `git init`
  - `git status` -> (check for track/untrack files)
  - `git diff` -> (to check changes)

- staging area/index
  - `git add`
    - `git add "filename"`
    - `git add .` (all files in directories but not in subdirectories)
    - `git add -A` (all files in directories and also in subdirectories)
    - `git add \*.js` (directory wildcard)
    - `git add \*_/_.js` (directory & subdirectory wildcard)
  - `git restore` => (to have the previous file same as add)
- local repository
  - `git commit -m "message"`
  - `git log` -> (version details of files)
  - `git log --oneline` ->(short info)
  - `git reset --soft` `"commitId from log"` or `HEAD` -> (to go back to previous commit/staging area)
  - `git reset "commitId"` or `HEAD` -> (to go back to previous commit/working directory)
  - `git reset --hard "commitId"` or HEAD` -> (to go back to initial commit)
  - `git checkout "commitId"` -> (go to specific commit and changes everything according to the commitID)

## Error and Solution

> Error

`git status`

```cmd
HEAD detached at eca1152
nothing to commit, working tree clean
```

> Solution

`git checkout master`

```cmd
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
```

if wanted new brand for this

`git checkout -b my-new-branch`
