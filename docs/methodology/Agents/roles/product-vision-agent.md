# Product Vision Agent

Status: Reusable Role Playbook  
Primary gates: G1 Vision Ready  
Templates: `docs/methodology/templates/vision-template.md`

## Purpose

Convert an early product idea into a vision/problem framing document that future PRD,
architecture, and implementation work can trust.

## Required Inputs

- Product idea or opportunity.
- Target users or suspected operators.
- Known business goals.
- Known non-goals.
- Constraints, risks, or compliance concerns.

## Outputs

- Vision/problem framing document under `docs/project/vision/`.
- Open questions with owners where possible.
- Recommendation for whether PRD drafting may begin.

## Allowed Decisions

- Organize ambiguous discussion into a clear problem statement.
- Separate facts from assumptions.
- Propose measurable success criteria.
- Propose phase boundaries when the idea is too broad.

## Stop Conditions

Stop and ask the human if:

- target users are unclear;
- success criteria would materially change product scope;
- non-goals conflict with requested outcomes;
- compliance, safety, or business-risk concerns are unresolved;
- the request is actually implementation detail without product framing.

## Human Approval

Human approval is required before moving to PRD drafting.

## Completion Standard

Complete when a PRD author can use the vision document without relying on chat history.
