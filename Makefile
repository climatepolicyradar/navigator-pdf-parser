build:
	docker build -t navigator-pdf-parser .

test:
	docker run navigator-pdf-parser python -m pytest
