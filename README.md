# workflow_run privileged-checkout PoC

Reproduction of the workflow shape used by
`GoogleCloudPlatform/microservices-demo` (`.github/workflows/deploy-pr.yaml`),
built on a repository I own so that nothing is executed against Google's
infrastructure.

- `ci-pr.yaml` runs on `pull_request`. A fork's PR job gets no secrets.
- `deploy-pr.yaml` runs on `workflow_run`, in this repository's context, checks
  out the fork's head commit, puts a secret in the environment, and then runs a
  script taken from that checkout.

The secret `STAGING_CLOUD_TOKEN` is a value planted for this test.
