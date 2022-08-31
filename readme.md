# FuseSoC Action

This action uses the [FuseSoC](https://github.com/olofk/fusesoc) build system to run regression tests.

## Example Usage
```yaml
name: FuseSoC Example
on:
  pull_request:

jobs:
  ci:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v3 # required
    - name: Setup SSH passphrase
      env: 
        SSH_PRIVATE_KEY: ${{secrets.SSH_PRIVATE_KEY}}
        SSH_PASSPHRASE: ${{secrets.SSH_PASSPHRASE}}
      run: | # provide SSH Key {optional}
        ssh-agent -a $SSH_AUTH_SOCK > /dev/null
        echo 'echo $SSH_PASSPHRASE' > ~/.ssh_askpass && chmod +x ~/.ssh_askpass
        echo "$SSH_PRIVATE_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh_askpass ssh-add - >/dev/null
    - name: Show SSH key add success
      runs: ssh-add -l # debug SSH Key {optional}
    - name: Run Regression Tests
      uses: Purdue-SoCET/SoCET-CI@main # core usage
      with:
        targets: | # List all FuseSoC Test Targets
          verilator
          lint
```

Should you need to access remote dependencies located in private repositories, you can add a private SSH Key to authorize Action with access.  These steps can be excluded if private access is not required.

> Note: you will need to store `SSH_PRIVATE_KEY` and `SSH_PASSPHRASE` in your projects "Actions Secrets"

# References:
- [SSH key in GitHub Actions](https://stackoverflow.com/questions/64953274/how-to-send-passphrase-for-ssh-add-with-github-actions)