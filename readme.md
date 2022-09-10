# FuseSoC Action

This action uses the [FuseSoC](https://github.com/olofk/fusesoc) build system to run regression tests.

## Example Usage
```yaml
name: FuseSoC Example
on:
  pull_request: [main]
  push: [main]

jobs:
  ci:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3 # required
      - name: Run Regression Tests
        uses: Purdue-SoCET/SoCET-CI@main # core usage
        with:
          ssh_private_key: ${{secrets.SSH_PRIVATE_KEY}}
          ssh_passphrase: ${{secrets.SSH_PASSPHRASE}}
          targets: | # List all Test Targets (shell commands)
            fusesoc --cores-root . run --target sim --tool verilator socet:aft:gpio:0.1.0
            ./shell_test.sh
```

> Note: the `targets` input can be any valid shell command or shell script and doesn't need to be related to fusesoc, verilator, etc...

## Testing with ACT
For local testing, you can user [act](https://github.com/nektos/act) to emulate the GitHub Actions cloud


# References:
- [SSH key in GitHub Actions](https://stackoverflow.com/questions/64953274/how-to-send-passphrase-for-ssh-add-with-github-actions)
- [Docker Run](https://aschmelyun.com/blog/using-docker-run-inside-of-github-actions/)

# TODO: 
- figure out how to better use act for testing
