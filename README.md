# AI-Assisted Development Methodology Baseline

This repository is a seed baseline for building software products with AI-assisted coding agents
such as Codex, Claude Code, and similar tools.

The baseline is meant to be cloned, initialized for a specific product, and then evolved with a
human team member and one or more AI agents. The method emphasizes documented authority,
traceability, explicit phase boundaries, planned tests, code review, remediation, and as-built
documentation close-out.

## Repository Model

```text
docs/methodology/
  Reusable methodology authority, templates, and agent guidance.

docs/project/
  Active project authority after initialization. This directory is created by
  scripts/init-project.sh and should govern the product being built.

docs/project-template/
  Clone-time skeleton used by the initialization script.

docs/examples/
  Non-authoritative examples and future worked examples.
```

## Core Method

The controlling standard is:

```text
docs/methodology/constitution/gendev.md
```

For meaningful implementation, agents and humans should work through this chain:

```text
vision
PRD
architecture
governance/security
phase build plan
tactical implementation plan
construction directive
implementation and tests
code review
remediation
as-built close-out
traceability update
```

Small projects may combine artifacts, but the content still needs to exist.

## Initialize A Project

From a fresh clone:

```bash
./scripts/init-project.sh "My Product Name"
```

This creates `docs/project/` with starter authority documents copied from
`docs/methodology/templates/`.

If `docs/project/` already exists, the script stops unless `--force` is supplied:

```bash
./scripts/init-project.sh --force "My Product Name"
```

## Agent Entry Point

Root-level agent instructions live in:

```text
AGENTS.md
```

AI coding agents should read that file first, then follow the constitution and the active project
documents under `docs/project/`.

## Reusable Assets

- Constitution: `docs/methodology/constitution/gendev.md`
- Operating workflow: `docs/methodology/guides/agentic-development-workflow.md`
- Gate model: `docs/methodology/guides/gates.md`
- Templates: `docs/methodology/templates/`
- Dev-skill guidance: `docs/methodology/dev-skills/`
- Agent role playbooks: `docs/methodology/Agents/roles/`
- Sample agent instructions: `docs/methodology/Agents/Sample-AGENTS.md`
- Examples: `docs/examples/`
- Methodology checker: `scripts/check-methodology.sh`

## Validate The Methodology State

Before implementation, phase close-out, or handoff, run:

```bash
./scripts/check-methodology.sh
```

On an uninitialized baseline, the checker reports that `docs/project/` does not exist yet. After
initialization, it checks the active project structure, manifest paths, accepted-doc placeholders,
phase planning sections, and traceability evidence signals.

## Current Status

This repository is a methodology baseline, not an implemented product. Product-specific source code,
tests, configuration, CI, deployment, and runtime commands should be added by the initialized project
as its architecture and phase plans mature.
