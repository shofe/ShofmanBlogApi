{ pkgs, ... }: {
	# Which nixpkgs channel to use.
	channel = "unstable"; # or "23.05", "22.11", etc.

	# Use https://search.nixos.org/packages to find packages
	# and https://search.nixos.org/options to find options.
	packages = [
		pkgs.python3
        pkgs.gcc
        pkgs.pkg-config
        pkgs.mysql80.client
	];

	# Sets environment variables in the workspace
	env = {};

	# Runs this command when the workspace is first created.
	onCreate = ''
		# Pinned version of pip:
		# https://github.com/nixos/nixpkgs/blob/23.05/pkgs/development/python-modules/pip/default.nix
		#
		# With this, we can deterministically get the same version of pip,
		# and therefore the same package hashes in \`requirements.lock.txt\`
		#
		# This is paired with a \`pre-commit\` hook that makes sure that the
		# \`requirements.txt\` and \`requirements.lock.txt\` files are in sync.
		#
		# You can still use \`pip install\` inside the virtual environment
		# for local testing, but it's not recommended as it may cause
		# dependency conflicts.
		python -m venv .venv
		source .venv/bin/activate
		pip install -r mysite/requirements.txt
	'';

	# Runs this command when the workspace is first created.
	# It is run in the background and can be used for things like
	# starting a server or running a file watcher.
	onStart = ''
		# Start the web server
		./devserver.sh
	'';
}