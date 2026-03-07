# LLM-Powered Multi-Agent Frameworks for Algorithmic Trading

[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](requirements.txt)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](Dockerfile)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A production-ready multi-agent system that combines LLM reasoning with Reinforcement Learning for auditable, high-performance algorithmic trading. A hierarchical pipeline of Analyst, Decision, Risk, and Execution agents processes multi-modal market data and communicates via structured messages to generate and execute trades with full XAI transparency.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Results](#results)
- [Evaluation](#evaluation)
- [License](#license)

---

## Overview

| Feature                             | Description                                                                                                      |
| :---------------------------------- | :--------------------------------------------------------------------------------------------------------------- |
| **Hierarchical Multi-Agent System** | Orchestrated pipeline of Analyst, Decision, Risk, and Execution agents for sequential, auditable decision-making |
| **Hybrid LLM + RL Intelligence**    | GPT-4 for high-level market interpretation combined with PPO/DQN for low-latency order execution                 |
| **Multi-Modal Data Pipeline**       | OHLCV data, real-time news sentiment via FinBERT, and macroeconomic indicators via FRED                          |
| **Explainable Trading**             | Natural language trade justifications with LLM Attention Visualization and SHAP values for RL policies           |
| **Backtesting Engine**              | Vectorized backtesting with slippage, transaction costs, Sharpe Ratio, MDD, and Bootstrap CI                     |
| **Prompt Engineering Framework**    | YAML-based prompt registry with version control and A/B testing for agent instructions                           |
| **Broker Integration**              | Abstracted broker layer supporting Alpaca and Interactive Brokers for paper and live trading                     |

---

## Architecture

The `MultiAgentOrchestrator` (`code/agents/orchestrator.py`) coordinates five specialized agents.

| Agent              | Responsibility        | Function                                                                              |
| :----------------- | :-------------------- | :------------------------------------------------------------------------------------ |
| **Analyst**        | Market Interpretation | Processes technical, sentiment, and macro data into a market insight report           |
| **Decision**       | Strategy Formulation  | Consumes the Analyst report and formulates a BUY/SELL/HOLD action and position size   |
| **Risk**           | Constraint Validation | Validates proposed trades against max drawdown, position limits, and volatility rules |
| **Execution**      | Trade Implementation  | Executes approved trades using RL-optimized order placement to minimize market impact |
| **Explainability** | Audit Trail           | Logs agent communication flow and generates natural language trade justifications     |

---

## Repository Structure

| Path                   | Description                                                   |
| :--------------------- | :------------------------------------------------------------ |
| `code/agents/`         | Orchestrator and agent communication logic                    |
| `code/backtest/`       | Vectorized backtesting engine                                 |
| `code/brokers/`        | Alpaca and IBKR broker connectors                             |
| `code/costs/`          | Transaction cost modeling (fixed, variable, market impact)    |
| `code/data/`           | OHLCV, news, and macro data ingestion and feature engineering |
| `code/explainability/` | LLM attention visualization and RL policy SHAP interpretation |
| `code/models/`         | Unified LLM wrapper (GPT-4, Claude, etc.)                     |
| `code/prompts/`        | Version-controlled YAML prompt registry per agent             |
| `code/risk/`           | Portfolio-level VaR and drawdown control                      |
| `code/rl/`             | Gymnasium trading environment and PPO/DQN trainer             |
| `code/strategies/`     | Quantitative baselines (Momentum, Mean-Reversion, Pairs)      |
| `code/reporting/`      | Trade reports and performance metrics                         |
| `figures/`             | Generated equity curves and XAI visualizations                |
| `results/`             | Experiment metrics, trade logs, and model checkpoints         |
| `tests/`               | Unit and integration tests                                    |

---

## Quick Start

### Docker (Recommended)

```bash
git clone https://github.com/quantsingularity/LLM-Powered-Multi-Agent-Frameworks-for-Algorithmic-Trading.git
cd LLM-Powered-Multi-Agent-Frameworks-for-Algorithmic-Trading

export OPENAI_API_KEY="sk-..."

docker-compose build && docker-compose up -d
docker-compose run llm-trading python code/run_experiment.py
```

### Local Installation

```bash
python3.10 -m venv venv && source venv/bin/activate
pip install -r requirements.txt

python code/run_experiment.py
```

Results are saved to `results/` and figures to `figures/`.

---

## Results

Pilot experiment on AAPL comparing the hybrid system against traditional and single-model baselines.

| Metric              | Buy and Hold | RL Only (PPO) | LLM Only | Hybrid LLM + RL |
| :------------------ | :----------- | :------------ | :------- | :-------------- |
| Total Return        | -2.15%       | -5.23%        | -4.89%   | **-4.04%**      |
| Sharpe Ratio        | -1.12        | -2.45         | -2.10    | **-1.80**       |
| Max Drawdown        | 6.21%        | 7.84%         | 5.92%    | **4.66%**       |
| Win Rate            | N/A          | 38.2%         | 40.5%    | **42.4%**       |
| Agent Decision Time | N/A          | N/A           | N/A      | 2.1s (+-0.4s)   |

---

## Evaluation

| Component              | Command                            |
| :--------------------- | :--------------------------------- |
| Unit tests             | `pytest tests/test_simple.py`      |
| Integration tests      | `pytest tests/test_integration.py` |
| Quantitative baselines | `code/strategies/baselines.py`     |
| Ablation studies       | `code/prompts/experiments/`        |
| Trade reports          | `code/reporting/trade_report.py`   |

---

## License

Licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
