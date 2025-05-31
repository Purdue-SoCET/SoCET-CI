# Used for GitHub Action

FROM ghcr.io/purdue-socet/socet-ci:63-fix-cicd

RUN alias riscv64-unknown-elf-gcc="riscv64-linux-gnu-gcc"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]