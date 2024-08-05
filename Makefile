pre-install-checks:
	which rbenv || (echo "Please install https://github.com/rbenv/rbenv" && exit 1)

pre-install: pre-install-checks
	rbenv install $(shell cat .ruby-version) -s
	gem update bundler
	bundle install

serve:
	bundle exec jekyll serve

serve-docker:
	bundle exec jekyll serve --host 0.0.0.0

serve-docker-with-drafts:
	bundle exec jekyll serve --host 0.0.0.0 --drafts

bash:
	docker build -t linnesq .
	docker run -it --rm -p 4000:4000 --entrypoint bash -v $$(pwd):/app linnesq