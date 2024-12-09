#!/bin/bash

### get current day and plus two days
current_day=$(date +%A)
two_days_later=$(date -d "+2 days" +%A)
echo "Current day: $current_day"
echo "Two days later: $two_days_later"

# Fetch the agenda for Monday and Tuesday, stripping ANSI codes, echo each line to agenda.md file
gcalcli agenda $current_day $two_days_later | sed -e 's/\x1b\[[0-9;]*m//g' | ./construct_agenda.py