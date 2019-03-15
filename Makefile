SHELL:=/bin/sh

.PHONY: dumpforms
dumpforms: ## dump form configuration
	docker-compose exec caluma python manage.py dumpdata \
	form.form \
	form.formquestion \
	form.question \
	form.questionoption \
	form.option \
	> dumps/forms.json