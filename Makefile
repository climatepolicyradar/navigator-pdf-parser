.PHONY: build test dev_install

dev_install:
	poetry install && poetry run pre-commit install

build:
	docker build -t navigator-pdf-parser .

test:
	docker run navigator-pdf-parser python -m pytest
