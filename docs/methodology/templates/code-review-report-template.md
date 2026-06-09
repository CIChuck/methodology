# Code Review Report: [Project Name] — Phase [N]: [Phase Name]

Status: Draft | Complete
Date:
Reviewer:
Authority: `docs/methodology/constitution/gendev.md` — Rule 7: Code Review Verifies Conformance
Source:
  Construction Directive: `docs/project/build-plan/phases/[directive].md`
  Tactical Plan: `docs/project/build-plan/phases/[tactical-plan].md`
  Architecture: `docs/project/architecture/[architecture-document].md`
  PRD: `docs/project/prd/[prd-document].md`
  Governance/Security: `docs/project/security-governance/[governance-document].md`

---

## Review Scope

```text
What code, files, or subsystems were reviewed?
What was explicitly not reviewed?
```

---

## Review Questions Evaluated

```text
1. Does the code implement the documented requirements?
2. Does the code preserve architecture boundaries?
3. Does the code preserve security and governance rules?
4. Does the code include required tests?
5. Does the CLI/API expose the required UAT surface?
6. Does the code introduce undocumented scope?
7. Does the implementation leave deferred features accidentally executable?
8. Does the documentation reflect the as-built result?
```

---

## Findings

Findings are ordered by severity.

Severity values:

```text
critical   — blocks acceptance; must be remediated before merge
major      — significant risk or spec drift; requires remediation
minor      — quality or consistency issue; should be remediated
advisory   — observation; remediation at discretion
```

### Finding [ID]

```text
id:
severity:
affected files/modules:
violated requirement or architecture rule:
problem:
risk:
required remediation:
required tests:
documentation impact:
```

<!-- Repeat for each finding -->

---

## Summary

| Severity | Count |
| --- | --- |
| Critical |  |
| Major |  |
| Minor |  |
| Advisory |  |

---

## Residual Risks

```text
What risks remain after remediation of the findings above?
What is not fully covered by the current test suite?
```

---

## Testing Gaps

```text
What required tests are absent or insufficient?
```

---

## Gate 5 Status

```text
[ ] critical findings: none remaining
[ ] major findings: remediated or explicitly accepted with documented rationale
[ ] tests were added or updated
[ ] known deviations from the directive are documented
```

Implementation is ready for acceptance: Yes | No | Pending remediation
