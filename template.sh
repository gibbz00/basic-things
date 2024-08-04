#!/bin/sh
replace_all() {
  fd --type file . | xargs sed -i -e "s^$1^$2^g"
}

# Assumptions: hosted on github.com, default branch is main.
replace_all 'PROJECT_DESCRIPTION' 'Some description'
replace_all 'AUTHOR_EMAIL' 'First Last <some@email.com>'
replace_all 'GITHUB_PATH' 'username/repo'
replace_all 'GITHUB_PAGES_URL' 'username.github.io'
replace_all 'CODE_COV_TOKEN' 'xxx'
replace_all 'ARCHITECTURE_URL' 'https://i.kym-cdn.com/photos/images/original/002/546/187/fb1.jpg'
