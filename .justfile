_default:
  @just --list

# sync python packages
sync:
  uv sync --all-groups --refresh

# generate configs for binder
freeze:
  uv pip compile pyproject.toml -o requirements.txt
  awk '{print "python-" $1}' .python-version > runtime.txt

# start local jupyter server
jupyter:
  uv run --with jupyter jupyter lab

