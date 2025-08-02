#!/bin/bash

echo "=== Docker CRM Fix Script ==="
echo

# Function to check if port is in use
check_port() {
    local port=$1
    if command -v lsof >/dev/null 2>&1; then
        lsof -i :$port >/dev/null 2>&1
    elif command -v netstat >/dev/null 2>&1; then
        netstat -tuln | grep ":$port " >/dev/null 2>&1
    else
        # Fallback: try to connect to the port
        timeout 1 bash -c "cat < /dev/null > /dev/tcp/localhost/$port" 2>/dev/null
    fi
}

# Check what's using port 6379
echo "1. Checking port 6379 usage..."
if check_port 6379; then
    echo "   ⚠️  Port 6379 is in use"
    echo "   Checking for Redis processes..."
    ps aux | grep redis | grep -v grep || echo "   No Redis processes found"
    echo "   Checking for Docker containers..."
    docker ps --format "table {{.Names}}\t{{.Ports}}" 2>/dev/null | grep 6379 || echo "   No Docker containers using port 6379"
else
    echo "   ✅ Port 6379 is available"
fi

echo
echo "2. Stopping any existing CRM containers..."
docker stop crm-redis crm-mysql 2>/dev/null || echo "   No containers to stop"

echo
echo "3. Removing any existing CRM containers..."
docker rm crm-redis crm-mysql 2>/dev/null || echo "   No containers to remove"

echo
echo "4. Solutions for your docker-compose.yml:"
echo "   a) Remove the obsolete 'version:' line from your docker-compose.yml"
echo "   b) Change Redis port mapping from '6379:6379' to '6380:6379'"
echo "   c) Or use the fixed docker-compose-fixed.yml provided"

echo
echo "5. Updated docker-compose.yml should look like:"
echo "---"
cat << 'EOF'
# Remove this line: version: '3.8'

services:
  crm-mysql:
    # ... your existing mysql config ...
    
  crm-redis:
    # ... your existing redis config ...
    ports:
      - "6380:6379"  # Changed from 6379:6379 to avoid conflict
EOF
echo "---"

echo
echo "6. After fixing, run:"
echo "   docker-compose up -d"
echo
echo "=== Fix complete! ==="