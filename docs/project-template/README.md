# Project Template

This directory defines the canonical `docs/project/` structure for an initialized product.

Run:

```bash
./scripts/init-project.sh "Project Name"
```

The script creates `docs/project/`, copies starter documents from `docs/methodology/templates/`,
and writes a project manifest.

The template is intentionally documentation-first. Product source code, package configuration,
tests, CI, deployment files, and runtime commands should be added only after the active project
authority documents define the stack and implementation plan.

## Manifest

`project.yaml` is the active project's tracking manifest. It records:

- project identity and current gate;
- human owner and approval fields;
- authority document paths;
- current phase paths;
- example/non-authority notes.

The manifest is a map, not a replacement for the documents it references.

## Validation

After initialization, run:

```bash
./scripts/check-methodology.sh
```

The checker validates the active project structure, manifest paths, phase-plan sections, and basic
traceability evidence signals.
