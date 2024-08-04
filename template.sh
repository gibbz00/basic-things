#!/bin/sh
replace_all() {
  fd --type file . | xargs sed -i -e "s^$1^$2^g"
}
