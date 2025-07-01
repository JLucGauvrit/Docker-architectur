# Nom du projet Docker Compose
PROJECT_NAME=dockerarchitecture
COMPOSE_FILE=docker-compose.yml

# Cibles

.PHONY: all build up down restart logs exec clean

all: build up

build:
	@echo "🛠️  Building Docker images..."
	docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME) build

up:
	@echo "🚀 Starting containers..."
	docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME) up -d

down:
	@echo "🧹 Stopping and removing containers..."
	docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME) down

restart:
	@echo "🔁 Restarting containers..."
	docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME) restart

logs:
	@echo "📋 Showing logs..."
	docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME) logs -f

exec:
	@echo "🔧 Opening shell inside llm_inference container..."
	docker exec -it llm_inference_gpu bash

clean: down
	@echo "🧼 Removing volumes..."
	docker volume prune -f
