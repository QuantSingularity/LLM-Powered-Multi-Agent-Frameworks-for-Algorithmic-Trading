#!/bin/bash
# Quick run: trains agents and backtests on the default symbols.
# Falls back to synthetic data automatically if market data cannot be fetched.
set -e
cd "$(dirname "$0")/.."
echo "=========================================="
echo "LLM Multi-Agent Algo-Trading - Quick Run"
echo "=========================================="
export PYTHONPATH="$(pwd)/trading:${PYTHONPATH}"
python trading/run_experiment.py
echo ""
echo "Quick run complete. Results in results/"
