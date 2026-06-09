#!/usr/bin/env bash
set -u

errors=0
warnings=0

info() {
  printf 'INFO: %s\n' "$1"
}

warn() {
  warnings=$((warnings + 1))
  printf 'WARN: %s\n' "$1"
}

fail() {
  errors=$((errors + 1))
  printf 'ERROR: %s\n' "$1"
}

require_file() {
  if [ ! -f "$1" ]; then
    fail "Missing required file: $1"
  fi
}

require_dir() {
  if [ ! -d "$1" ]; then
    fail "Missing required directory: $1"
  fi
}

check_heading() {
  file="$1"
  heading="$2"

  if ! grep -Eq "^## ${heading}([[:space:]]|$)" "$file"; then
    fail "$file is missing section: ## $heading"
  fi
}

check_baseline_files() {
  require_file "AGENTS.md"
  require_file "README.md"
  require_file "docs/methodology/constitution/gendev.md"
  require_file "docs/methodology/guides/agentic-development-workflow.md"
  require_file "docs/methodology/guides/gates.md"
  require_dir "docs/methodology/templates"
  require_dir "docs/methodology/dev-skills"
  require_dir "docs/methodology/Agents/roles"
  require_file "scripts/init-project.sh"
}

check_manifest_paths() {
  manifest="docs/project/project.yaml"

  require_file "$manifest"
  if [ ! -f "$manifest" ]; then
    return
  fi

  while IFS= read -r line; do
    path="$(
      printf '%s\n' "$line" |
        sed -n 's/^[[:space:]]*[A-Za-z0-9_]*:[[:space:]]*\(docs\/[^ #]*\).*$/\1/p'
    )"

    if [ -n "$path" ] && [ ! -e "$path" ]; then
      fail "Manifest path does not exist: $path"
    fi
  done < "$manifest"
}

check_project_structure() {
  require_dir "docs/project/vision"
  require_dir "docs/project/prd"
  require_dir "docs/project/architecture"
  require_dir "docs/project/security-governance"
  require_dir "docs/project/decisions"
  require_dir "docs/project/build-plan"
  require_dir "docs/project/build-plan/phases"
  require_dir "docs/project/testing"
  require_dir "docs/project/traceability"
  require_dir "docs/project/as-built"
}

check_sample_reference_drift() {
  paths="README.md AGENTS.md docs/examples docs/methodology/Agents"

  if [ -d "docs/project" ]; then
    paths="$paths docs/project"
  fi

  if grep -R "docs/sample-project" -n $paths 2>/dev/null; then
    fail "Found stale docs/sample-project reference."
  fi
}

check_accepted_doc_placeholders() {
  find docs/project -type f \( -name '*.md' -o -name '*.yaml' \) -print |
    while IFS= read -r file; do
      if grep -Eq '^(Status|status):[[:space:]]*(Accepted|Complete|accepted|complete)[[:space:]]*$' "$file"; then
        if grep -Eq '\[[^][]+\]|TBD|Replace with' "$file"; then
          printf 'ERROR: Accepted/complete document still has placeholders: %s\n' "$file"
          exit 1
        fi
      fi
    done

  if [ "$?" -ne 0 ]; then
    errors=$((errors + 1))
  fi
}

check_phase_plans() {
  for file in docs/project/build-plan/phases/*build-plan*.md; do
    [ -e "$file" ] || continue
    check_heading "$file" "Acceptance Criteria"
    check_heading "$file" "Test Strategy"
    if ! grep -Eq '^## Documentation Close-Out' "$file"; then
      fail "$file is missing documentation close-out section"
    fi
  done

  for file in docs/project/build-plan/phases/*tactical*.md; do
    [ -e "$file" ] || continue
    check_heading "$file" "Workstreams"
    check_heading "$file" "Accuracy Pass"
    if ! grep -Eq 'Verification Commands' "$file"; then
      fail "$file is missing verification command guidance"
    fi
  done
}

check_traceability_evidence() {
  for file in docs/project/traceability/*.md; do
    [ -e "$file" ] || continue
    awk -F'|' '
      NR > 2 {
        status = tolower($11)
        evidence = $9
        review = $10
        gsub(/[[:space:]]/, "", status)
        gsub(/[[:space:]]/, "", evidence)
        gsub(/[[:space:]]/, "", review)
        if (status == "verified" && (evidence == "" || review == "")) {
          printf "%s:%d\n", FILENAME, FNR
        }
      }
    ' "$file" |
      while IFS= read -r location; do
        printf 'ERROR: Traceability row marked verified without evidence/review: %s\n' "$location"
        exit 1
      done

    if [ "$?" -ne 0 ]; then
      errors=$((errors + 1))
    fi
  done
}

check_baseline_files
check_sample_reference_drift

if [ ! -d "docs/project" ]; then
  info "docs/project is not initialized. Run: ./scripts/init-project.sh \"Project Name\""
else
  check_project_structure
  check_manifest_paths
  check_accepted_doc_placeholders
  check_phase_plans
  check_traceability_evidence
fi

if [ "$errors" -gt 0 ]; then
  printf '\nMethodology check failed: %d error(s), %d warning(s).\n' "$errors" "$warnings"
  exit 1
fi

printf '\nMethodology check passed: %d warning(s).\n' "$warnings"
