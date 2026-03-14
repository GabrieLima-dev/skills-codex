#!/usr/bin/env bash
set -euo pipefail

BASE="${1:-skills}"
MIN_SCORE="${2:-95}"

ruby skills/governance/scripts/behavior_contract_test.rb --base "$BASE"
ruby skills/governance/scripts/score_skills.rb --base "$BASE" --output /tmp/skills_metrics.md
ruby skills/governance/scripts/gate_skills.rb --base "$BASE" --min-score "$MIN_SCORE"

if [[ "$BASE" == "skills" ]]; then
  ruby skills/governance/scripts/check_drift.rb
fi

echo "ALL_CHECKS_OK base=$BASE min_score=$MIN_SCORE"
