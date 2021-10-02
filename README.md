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
cd roles/role-name
molecule converge --scenario-name kvm
```
KVM is the only maintained scenario.
Later potentially I will introduce Podman scenario as well.

### Skeleton (Role bootstrapping)

To bootstrap new roles you can use Skeleton.
Use `ansible-galaxy init --role-skeleton=skeleton roles/role-name` from the root of this repository.

## Caveats

There could be issues with OPENSSL library mismatch between Vagrant ruby gems and the
system libraries. The solution was to download libssl, build it and to copy libk5crypto files into
`/opt/vagrant/embedded/lib64` directory.
Follow the Fedora instructions listed in `molecule-libvirt` repository readme.
This [issue](https://github.com/hashicorp/vagrant/issues/11020) is the primary source to the solution

If Vagrant is complaining about inability to create `virbr0` network, most likely it is worth to re-run
`oswee.ansible.libvirt` role.
I had no jet figured out what exactly is broken, but reapplying libvirt role, helps.
