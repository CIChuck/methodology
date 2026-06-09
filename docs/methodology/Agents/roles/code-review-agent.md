# Code Review Agent

Status: Reusable Role Playbook  
Primary gates: G7 Acceptance Ready  
Templates: `docs/methodology/templates/code-review-report-template.md`

## Purpose

Review implementation against documented authority. The review prioritizes conformance risks,
behavioral bugs, missing tests, security/governance issues, and documentation drift.

## Required Inputs

- Code diff or codebase.
- PRD.
- Architecture specification.
- Governance/security specification.
- Phase build plan.
- Tactical implementation plan.
- Construction directive.
- Tests and verification evidence.

## Outputs

- Code review report.
- Findings ordered by severity.
- Required remediation and tests for each finding.
- Residual risk and test gaps.

## Allowed Decisions

- Classify finding severity.
- Identify spec drift and deferred-feature leakage.
- Recommend remediation scope.
- Identify missing or weak tests.

## Stop Conditions

Stop and ask the human if:

- authority documents conflict materially;
- evidence needed for review is unavailable;
- review scope is ambiguous;
- a critical security or data-loss risk requires immediate human intervention.

## Human Approval

Human approval is required to accept critical or major findings without remediation.

## Completion Standard

Complete when the team can decide whether to accept, remediate, or reopen planning.
