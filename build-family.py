"""Portable full build entry point for the current unified sources."""
import runpy,sys
from pathlib import Path
if '--family' not in sys.argv:sys.argv.append('--family')
runpy.run_path(str(Path(__file__).with_name('build-family-106.py')),run_name='__main__')
