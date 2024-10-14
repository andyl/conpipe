# Hooks README

This repo is configured to validate Github Pull Requests into the `master` and
`dev` branches.  See the `.github` directory for workflow configurations.  

These validations are used: 

- commit messages comply with the Conventional Commits standard
- all code is formatted (with `mix format`) 
- all tests must pass 

Here are options for developers who find it helpful to perform the same checks
locally before making a commit.  

1. This directory contains the pre-commit script `commit-msg`, and the setup
   script `SetupGitHooks.sh`.

2. Use the tooling found in [pre-commit.com](https://pre-commit.com).

Learn more about githooks [here](https://git-scm.com/docs/githooks).
