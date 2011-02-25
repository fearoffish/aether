# Aether

## Summary

We use the [Opscode Platform][2] at [PharmMD][5] to manage our 50+ servers that we have on [Amazon EC2][6].  Sometimes it's nicer to have a web GUI tool that you can point non-techies to, instead of getting them to set up [Chef][1] commandline tools.

Aether is that web management interface for our Chef server managed servers.  It runs on Rails 3, and currently uses HTTP Basic auth for 'logging in'.

## Features

* List the servers currently running
* Show ssh and http links to those servers
* Show ip addresses and instance ids.

## Planned Features

* A better auth system, possibly?
* Manage servers (or clusters of servers) with a web interface
* Monitor logs of the Chef runs from those servers (using [http://pusherapp.com][7])
* Show estimated costs of servers

## Getting Started

Aether uses `Chef::Knife` to communicate with your Chef Server, it is configured in exactly the same manner.  By default Aether will look for an `/etc/chef/knife.rb` file, which should contain your `Chef::Knife` details, you can use `knife configure -i` to create one.  Obviously you will need your private keys and other details at hand.

Once that's configured and placed in `/et/chef/knife.rb` (this is configurable, see below) then you just need to run through the configuration options (see below) and you're good to go.

## Configurable Options

We use an App config system to set up configurable options, default options are set in `config/app.rb`.  If you want to override something, then you create a file in `config/app/` that matches your `RAILS_ENV`.  e.g. `config/app/production.rb`.  There is a sample in that folder for you to copy and change.  Here's an example of how you would override the method we use for grouping nodes into clusters.

    class App < Configurable
      # node: the node information as given by Chef
      # name: the name that is being compared against  e.g. 'production'
      config.cluster_identification = lambda {|node,name| node[:cluster_name] == name }
    end

Links
-----

* [aether][4]: Aether homepage
* [chef][1]:   Chef, the automated deployment tool
* [rails][2]:  Ruby on Rails


[1]:  http://github.com/opscode/chef
[2]:  http://github.com/rails/rails
[3]:  http://manage.opscode.com/
[4]:  https://github.com/fearoffish/aether
[5]:  http://www.pharmmd.com/
[6]:  http://aws.amazon.com/ec2/
[7]:  http://pusherapp.com
[8]:  