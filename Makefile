.PHONY: setup-environment test package

setup-environment: ## Prepare local environment for testing purposes, also used in Fizz
	pip3 install virtualenv==20.0.31
	virtualenv venv --system-site-packages
	source venv/bin/activate; \
	pip3 install -r requirements.txt

test: setup-environment ## Run unit tests
	source venv/bin/activate; \
	PYTHONPATH=./src python3 -m unittest discover -s src/test/ -p '*_tests.py' -v

package: test ## Build deployment package
	source venv/bin/activate; \
    	python3 package.py
