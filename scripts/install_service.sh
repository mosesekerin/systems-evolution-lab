#!/bin/bash
set -e

echo "Installing systemd service..."
sudo cp /opt/notesapp/systemd/notesapp.service /etc/systemd/system/notesapp.service

echo "Reloading systemd..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

echo "Starting the notesapp service"
./scripts/deploy.sh