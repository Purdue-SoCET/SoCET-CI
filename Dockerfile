# Used for GitHub Action

FROM verilator/verilator:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]