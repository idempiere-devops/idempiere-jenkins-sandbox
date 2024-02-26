# iDempiere/Jenkins Sandbox

This repository aims to help you learn how to do CI/CD with iDempiere.

## Prerequisites

- [Vagrant](https://developer.hashicorp.com/vagrant/install#linux)
- [Virtual Box](https://www.virtualbox.org/wiki/Linux_Downloads)

## Steps

1. [Configure Jenkins](doc/CONFIGURE_JENKINS.md)
2. [Configure iDempiere](doc/CONFIGURE_IDEMPIERE.md)
3. [Add additional agent](doc/ADD_AGENT.md)

## Common Commands

Start virtual machines:

```shell
vagrant up
```

Stop:

```shell
vagrant halt
```

Restart:

```shell
vagrant reload jenkins
vagrant reload idempiere
```

Show ports:

```shell
vagrant port jenkins
vagrant port idempiere
```

Open terminal:

```shell
vagrant ssh jenkins
vagrant ssh idempiere
```

Destroy virtual machines:

```shell
vagrant destroy
```

## Troubleshooting

### IP Range Not Allowed

If you've received this error when running `vagrant up`:

> The IP address configured for the host-only network is not within the
allowed ranges. Please update the address used to be within the allowed
ranges and run the command again.

Yo can change the ips here:

```ruby
Vagrant.configure("2") do |config|
  # ...
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.network "private_network", ip: "PUT A VALID IP"
    # ...
  end

  config.vm.define "idempiere" do |idempiere|
    idempiere.vm.network "private_network", ip: "PUT A VALID IP"
    # ...
  end
end
```

Or visit: <https://www.virtualbox.org/manual/ch06.html#network_hostonly> for more information.
