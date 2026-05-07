---
description: Fetch a GitHub issue, analyze it, implement the fix, commit, push, and verify CI
agent: build
---

## Task

Fix GitHub issue #$1 using the BMAD methodology (Build, Measure, Analyze, Decide).

## Workflow

1. **Fetch the issue** — Run `gh issue view $1` to get the full issue details (title, body, labels, comments).

2. **Analyze** — Understand the root cause by:
   - Reading the relevant code referenced in the issue
   - Identifying the affected files and functions
   - Understanding the expected vs actual behavior

3. **Implement the fix** — Apply the BMAD approach:
   - **Build**: Write the minimal fix that addresses the issue
   - **Measure**: Run the existing test suite to validate
   - **Analyze**: Verify the fix doesn't introduce regressions
   - **Decide**: If tests pass, proceed; if not, iterate

4. **Commit and push** — Once tests pass:
   - Create branch `fix/issue-$1` if not already on a feature branch (never push directly to main/master)
   - Stage the changed files
   - Commit with message: `fix: <concise description> (closes #$1)`
   - Push to the current branch

5. **Verify CI** — After pushing:
   - Wait a few seconds, then run `gh run list --limit 1` to check the CI status
   - If CI fails, analyze the failure with `gh run view <run-id> --log-failed`
   - Fix CI issues and repeat steps 3-5
   - Report the final CI status

## Important

- Do NOT push to main/master directly
- Follow the project's existing code style and conventions
- If the issue is unclear or requires more information, stop and ask before implementing
