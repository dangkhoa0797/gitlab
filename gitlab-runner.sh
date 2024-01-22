#!/bin/bash

# Replace these values with your own
GITLAB_CI_URL="YOUR_GITLAB_CI_URL"
REGISTRATION_TOKEN="YOUR_REGISTRATION_TOKEN"
RUNNER_NAME="YOUR_RUNNER_NAME"
RUNNER_TAGS="YOUR_RUNNER_TAGS"

# Install Docker
sudo apt update
sudo apt install -y docker.io

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Install GitLab Runner
sudo curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner

# Register GitLab Runner
sudo gitlab-runner register \
  --non-interactive \
  --url "${GITLAB_CI_URL}" \
  --registration-token "${REGISTRATION_TOKEN}" \
  --executor "docker" \
  --name "${RUNNER_NAME}" \
  --tag-list "${RUNNER_TAGS}"

# Start GitLab Runner
sudo gitlab-runner start

echo "GitLab Runner has been installed and registered."
