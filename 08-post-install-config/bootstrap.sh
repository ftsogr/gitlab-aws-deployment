
#!/bin/bash
# GitLab Post-Install Script
# This script configures GitLab after installation using its API.

set -e

GITLAB_URL="${GITLAB_URL:-https://gitlab.ftso.gr}"
ROOT_TOKEN="${ROOT_TOKEN:-YOUR_PERSONAL_ACCESS_TOKEN}"

# Wait for GitLab to become ready
echo "⏳ Waiting for GitLab to respond at $GITLAB_URL..."
until curl --silent --fail --header "PRIVATE-TOKEN: $ROOT_TOKEN" "$GITLAB_URL/api/v4/version" > /dev/null; do
  sleep 5
done
echo "✅ GitLab is reachable."

# Create a group
GROUP_NAME="ftso-group"
GROUP_PATH="ftso-group"

echo "📦 Creating group: $GROUP_NAME"
GROUP_RESPONSE=$(curl --silent --fail --request POST "$GITLAB_URL/api/v4/groups" \
  --header "PRIVATE-TOKEN: $ROOT_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{"name": "$GROUP_NAME", "path": "$GROUP_PATH"}")

GROUP_ID=$(echo "$GROUP_RESPONSE" | grep -oP '"id":\s*\K\d+')

if [ -z "$GROUP_ID" ]; then
  echo "❌ Failed to create group or retrieve group ID."
  exit 1
fi

echo "✅ Group created with ID: $GROUP_ID"

# Create a project in the group
PROJECT_NAME="gitlab-hello-world"

echo "🚀 Creating project: $PROJECT_NAME under group ID: $GROUP_ID"
curl --silent --fail --request POST "$GITLAB_URL/api/v4/projects" \
  --header "PRIVATE-TOKEN: $ROOT_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{"name": "$PROJECT_NAME", "namespace_id": $GROUP_ID}"

echo "🎉 Post-install setup complete!"
