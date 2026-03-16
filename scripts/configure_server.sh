#!/bin/bash
set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Installing required packages..."
sudo dnf install -y git nodejs

echo "Creating service user..."
sudo useradd --system --create-home --shell /sbin/nologin notesapp || true

echo "Creating application directory..."
sudo mkdir -p /opt/notesapp
sudo chown notesapp:notesapp /opt/notesapp