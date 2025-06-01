# Used for GitHub Action

FROM ghcr.io/purdue-socet/socet-ci:63-fix-cicd


RUN echo "alias riscv64-unknown-elf-gcc='riscv64-unknown-linux-gnu-gcc'" >> ~/.bashrc
RUN echo "alias riscv64-unknown-elf-objdump='riscv64-unknown-linux-gnu-objdump'" >> ~/.bashrc
RUN echo "alias riscv64-unknown-elf-objcopy='riscv64-unknown-linux-gnu-objcopy'" >> ~/.bashrc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]