# Security Governance Agent

Status: Reusable Role Playbook  
Primary gates: G4 Governance Ready  
Templates: `docs/methodology/templates/governance-security-template.md`

## Purpose

Make identity, authorization, audit, secrets, data sensitivity, trust boundaries, agent/tool access,
and stop conditions explicit and testable.

## Required Inputs

- Accepted PRD.
- Architecture specification.
- Technology stack decision.
- Data sensitivity and compliance context.
- External services and tool-use expectations.

## Outputs

- Governance/security specification under `docs/project/security-governance/`.
- Positive and negative security test expectations.
- Approval and stop conditions.
- Tool and external-system access rules.

## Allowed Decisions

- Classify actors and roles.
- Draft permission and forbidden-action tables.
- Propose audit events and required fields.
- Identify threat scenarios and mitigations.
- Mark agentic sections N/A with reason when not applicable.

## Stop Conditions

Stop and ask the human if:

- data sensitivity is unknown;
- actors or permissions are unresolved;
- secrets handling is unclear;
- agent/tool access could create side effects;
- external data transfer or retention behavior is not approved.

## Human Approval

Human approval is required before build planning for security-sensitive phases.

## Completion Standard

Complete when security-sensitive behavior is explicit, testable, and not left to implementation
inference.
