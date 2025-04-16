#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Path to construct_agenda.py
CONSTRUCT_AGENDA_PATH="$SCRIPT_DIR/construct_agenda.py"

# Path to agenda_construction.sh
AGENDA_CONSTRUCTION_PATH="$SCRIPT_DIR/agenda_construction.sh"

# Path to config.yaml
CONFIG_PATH="$SCRIPT_DIR/config.yaml"

# Check if construct_agenda.py exists
if [[ ! -f "$CONSTRUCT_AGENDA_PATH" ]]; then
  echo "Error: $CONSTRUCT_AGENDA_PATH not found!"
  exit 1
fi

# Update agenda_construction.sh with the correct path
sed -i "s|some_directory/construct_agenda.py|$CONSTRUCT_AGENDA_PATH|" "$AGENDA_CONSTRUCTION_PATH"

# Prompt the user for the path to Agenda.md
read -p "Please enter the path to your Agenda.md file: " AGENDA_MD_PATH

# Create or update config.yaml with the agenda_path
cat <<EOL > "$CONFIG_PATH"
### yaml file for configuring setup ###

agenda_path: '$AGENDA_MD_PATH'
EOL

echo "Initialization complete. Path to construct_agenda.py has been updated in agenda_construction.sh and agenda_path has been set in config.yaml."
