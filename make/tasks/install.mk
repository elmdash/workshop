TASKS += install install-system install-secrets install-apps
USAGE += .install-usage


install: install-system install-secrets install-apps

install-system:
	ansible-playbook -i hosts/home/local books/system.yml --ask-become-pass

install-secrets:
	ansible-playbook -i hosts/home-secure/local books/secrets.yml --ask-become-pass --ask-vault-pass

install-apps:
	ansible-playbook -i hosts/home/local books/apps.yml --ask-become-pass

.install-usage:
	$(call describe,"install","install everything")
	$(call describe,"install-system","install system requirements")
	$(call describe,"install-secrets","install ssh configurations or other secrets")
	$(call describe,"install-apps","install applications")
