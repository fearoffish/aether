# Aether

## Summary

We use the [Opscode Platform][2] at [PharmMD][5] to manage our 50+ servers that we have on [Amazon EC2][6].  Sometimes it's nicer to have a web GUI tool that you can point non-techies to, instead of getting them to set up [Chef][1] commandline tools.

Aether is that web management interface for our Chef server managed servers.

## Features

* List the servers currently running
* Show ssh links to those servers

## Planned Features

* Manage servers (or clusters of servers) with a web interface
* Monitor logs of the Chef runs from those servers (using [http://pusherapp.com][7])
* Show estimated costs of servers

Links
-----

* [aether][4]: Aether homepage
* [chef][1]:   Chef, the automated deployment tool
* [opscode][2]


[1]:  http://github.com/opscode/chef
[2]:  http://github.com/rails/rails
[3]:  http://manage.opscode.com/
[4]:  https://github.com/fearoffish/aether
[5]:  http://www.pharmmd.com/
[6]:  http://aws.amazon.com/ec2/
[7]:  http://pusherapp.com