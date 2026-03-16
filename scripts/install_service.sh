#!/bin/bash
set -e

echo "Installing systemd service..."
sudo cp systemd/notesapp.service /etc/systemd/system/notesapp.service

echo "Reloading systemd..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload