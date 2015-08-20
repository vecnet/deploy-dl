VecNet Digital Library Deploy
=============================

This repository contains the ansible scripts used to deploy the VecNet Digital
Library system.
The deployment requires [Ansible] v1.9 or greater.

[Ansible]: http://www.ansible.com/home

## Testing

If you have Vagrant installed, you can create VMs using it and run ansible with
the local environment for testing.
For example

    $ vagrant up sa
    $ make standalone deploy

The test VM is accessable at http://192.168.33.13/ .


## Deployment

To deploy to an environment you need to have your public ssh key installed on
the appropriate hosts.

Then to provision the QA environment run the following

    $ make qa deploy

To deploy to production

    $ make production deploy

### Setting up an environment for deployment

 1. Create a deploy user.
 2. Put your public ssh key in the deploy user's `authorized_keys` file
 3. Put the TLS keys into `/etc/certs/`
 4. Put the pubtkt key in `/etc/certs/`
