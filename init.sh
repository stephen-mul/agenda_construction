#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Path to construct_agenda.py
CONSTRUCT_AGENDA_PATH="$SCRIPT_DIR/construct_agenda.py"

# Path to agenda_construction.sh
AGENDA_CONSTRUCTION_PATH="$SCRIPT_DIR/agenda_construction.sh"

# Check if construct_agenda.py exists
if [[ ! -f "$CONSTRUCT_AGENDA_PATH" ]]; then
  echo "Error: $CONSTRUCT_AGENDA_PATH not found!"
  exit 1
fi

# Update agenda_construction.sh with the correct path
sed -i "s|some_directory/construct_agenda.py|$CONSTRUCT_AGENDA_PATH|" "$AGENDA_CONSTRUCTION_PATH"

echo "Initialization complete. Path to construct_agenda.py has been updated in agenda_construction.sh."
