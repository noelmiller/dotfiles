#!/usr/bin/env nu
open brew_packages.yml | get name | brew install ...$in
