#!/bin/bash

if [[ ! $(chezmoi git diff) == "" ]]; then
  echo "!="
else
  echo "="
fi
