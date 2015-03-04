
ENVIRONMENT:=local
ENV_LIST:=local jcu qa production
HOSTS=

# make each envrionment a target which sets
# the ENVIRONMENT variable
.PHONY: $(ENV_LIST)
$(ENV_LIST):
	$(eval ENVIRONMENT:=$@)

# make host targets to limit the applicable hosts
.PHONY: standalone
standalone:
	$(eval HOSTS=standalone)

.PHONY: echo
echo:
	$(info using envrionment $(ENVIRONMENT))

# run ansible
#
# the patsubst will only add a -l option if any hosts have been declared. Otherwise Ansible will run the play for every host declared in the inventory.
deploy:
	ansible-playbook playbook.yml -i env/$(ENVIRONMENT)/inventory --ask-vault-pass $(patsubst %,-l %,$(HOSTS))
