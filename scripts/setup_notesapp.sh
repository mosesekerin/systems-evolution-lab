#!/bin/bash
set -e

echo "Installing application dependencies..."
cd /opt/notesapp
sudo -u notesapp npm install --omit=dev

echo "Preparing persistent storage..."
sudo touch /opt/notesapp/notes.json
sudo chown notesapp:notesapp /opt/notesapp/notes.json

echo "Preparing log file..."
sudo touch /var/log/notesapp.log
sudo chown notesapp:notesapp /var/log/notesapp.log

echo "Preparing systemd for service management"
./scripts/install_service.sh