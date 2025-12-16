#!/bin/bash
echo "🚀 Starting TaskFlow..."
docker-compose up -d
echo "⏳ Waiting for services to be healthy..."
sleep 5
docker-compose ps
echo "✅ TaskFlow started!"
echo "📍 Backend: http://localhost:3000"
echo "📊 PostgreSQL: localhost:5432"
echo "💾 Redis: localhost:6379"
