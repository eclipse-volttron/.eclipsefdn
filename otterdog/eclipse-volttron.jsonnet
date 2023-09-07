local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-volttron') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse VOLTTRON",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('ACTION_DISPATCH_PAT') {
      value: "********",
    },
    orgs.newOrgSecret('AUTO_PROJECT_PAT') {
      value: "********",
    },
    orgs.newOrgSecret('DOCKER_API_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('DOCKER_USER') {
      value: "********",
    },
    orgs.newOrgSecret('PYPI_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('PYPI_USER') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('docker') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('eclipse-volttron.github.io') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('github-tooling') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-actuator') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-ansible') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://reviewable-prod.appspot-preview.com/github') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/volttron-ansible/136310/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://devops.pnnl.gov/api/v4/projects/125/mirror/pull') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
          insecure_ssl: "1",
          secret: "********",
        },
      ],
    },
    orgs.newRepo('volttron-bacnet-proxy') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
      ],
    },
    orgs.newRepo('volttron-boptest') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-core') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      has_discussions: true,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://app.codacy.com/events/github/15682a03b8594a598b2c35f15d5b278b') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('TEST_PYPI_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('TEST_PYPI_USER') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('test_env'),
      ],
    },
    orgs.newRepo('volttron-dnp3-master') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-dnp3-outstation') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-docs') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/eclipse-volttron/239940/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "push"
          ],
        },
      ],
    },
    orgs.newRepo('volttron-energyplus') {
    },
    orgs.newRepo('volttron-forward-historian') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-gridappsd') {
    },
    orgs.newRepo('volttron-lib-auth') {
      allow_update_branch: false,
      default_branch: "initial_dev",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-bacnet-driver') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('PRIVATE_SSH_KEY') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('volttron-lib-base-driver') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('test_env'),
      ],
    },
    orgs.newRepo('volttron-lib-base-historian') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-curve') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-dnp3-driver') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('test_env'),
      ],
    },
    orgs.newRepo('volttron-lib-fake-driver') {
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('PRIVATE_SSH_KEY') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('volttron-lib-modbus-driver') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('PRIVATE_SSH_KEY') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('volttron-lib-modbustk-driver') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('PRIVATE_SSH_KEY') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('volttron-lib-rmq') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-sql-historian') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-tagging') {
    },
    orgs.newRepo('volttron-lib-tls') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-lib-web') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://devops.pnnl.gov/api/v4/projects/117/mirror/pull') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
          insecure_ssl: "1",
          secret: "********",
        },
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
      ],
    },
    orgs.newRepo('volttron-lib-zmq') {
      allow_update_branch: false,
      default_branch: "initial_dev",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-listener') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      template_repository: "VOLTTRON/volttron-new-agent-template",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://devops.pnnl.gov/api/v4/projects/121/mirror/pull') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
          insecure_ssl: "1",
          secret: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('test_env'),
      ],
    },
    orgs.newRepo('volttron-mongo-tagging') {
    },
    orgs.newRepo('volttron-openadr-ven') {
      allow_update_branch: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://devops.pnnl.gov/api/v4/projects/120/mirror/pull') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
          insecure_ssl: "1",
          secret: "********",
        },
      ],
    },
    orgs.newRepo('volttron-platform-driver') {
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
      ],
    },
    orgs.newRepo('volttron-postgresql-historian') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-sql-historian') {
      allow_update_branch: false,
      description: "volttron-sql-historian",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-sqlite-historian') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-sqlite-tagging') {
    },
    orgs.newRepo('volttron-testing') {
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('test_env'),
      ],
    },
    orgs.newRepo('volttron-web-client') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('volttron-website') {
      allow_update_branch: false,
      default_branch: "master",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
