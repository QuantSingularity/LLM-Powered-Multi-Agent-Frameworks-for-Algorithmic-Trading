import os
import sys

# Make the repo's code/ importable so tests can use bare names (agents, backtest, ...).
# conftest is at code/tests/conftest.py, so code/ is the parent of this file's dir.
_CODE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if _CODE_DIR not in sys.path:
    sys.path.insert(0, _CODE_DIR)
