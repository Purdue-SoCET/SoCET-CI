# Used for GitHub Action

FROM ghcr.io/purdue-socet/socet-ci:main

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]