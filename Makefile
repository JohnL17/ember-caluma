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

.PHONY: loadforms
loadforms: ## load form configuration
	docker-compose exec caluma python manage.py loaddata dumps/forms.json

.PHONY: flush
flush: ## flush database
	docker-compose exec caluma python manage.py flush

.PHONY: dbshell
dbshell: ## open database shell
	docker-compose exec db psql -U caluma
