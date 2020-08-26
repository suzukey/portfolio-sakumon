skaffold-dev:
	skaffold dev -f skaffold.dev.yaml

skaffold-prod:
	skaffold dev -f skaffold.prod.yaml

test-run:
	docker-compose run --rm backend rake db:setup
	docker-compose up
