# Used for GitHub Action

FROM ghcr.io/purdue-socet/socet-ci:63-fix-cicd

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]