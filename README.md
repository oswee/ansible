# Oswee Ansible Collection

This is NOT PRODUCTION READY collection.
Some of roles are specific to particular usecases.

Most likely You don't want to use this collection ATM.

## Usage

Include the collection in your projects collections.yml file and import it.

```bash
ansible-galaxy collection install -r collections.yml -f
```
`-f` flag will force collection upgrade.

To test the role use

```bash
cd roles/<role-name>
molecule converge --scenario-name kvm
```
KVM is the only maintained scenario.
Later potentially I will introduce Podman scenario as well.
