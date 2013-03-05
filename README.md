Description
===========

This is a fork of [Atalanta's supervisord](https://github.com/Atalanta/chef-supervisord) chef cookbook. It installs and configures supervisord and supervised programs.

Changes
=======
## v0.1.0:
* Replaced uploaded `supervisor.conf` file with a a template that gets rendered with attributes.
* Added the `includes` recipe, which writes included `.conf` files for supervised programs.

Attributes
==========
There are a number of attributes that correspond to supervisord settings. For a full list, see `attributes/default.rb` and the [supervisord config docs](http://supervisord.org/configuration.html).

Additionally, there is a `node[:supervisord][:data_bag_items]` attribute, which should be overriden in a role. This tells the `includes` recipe, which data bag items to use in order to write config files for supervised programs/program groups.

Recipes
=======
This cookbook contains the following recipes.

`default`
---------
Installs and configures supervisord

`includes`
------------------
This recipe writes a config file for programs/groups that will be supervised. Configuration data is read from a `supervisord` data bag. Each item in the data bag should contain keys/values that correspond to the settings that would typically go within an `[program:x]` (or `[group:x]`) section in the supervisord config file (see [the supervisord docs](http://supervisord.org/configuration.html#program-x-section-example) for more information).

A sample data bag item for a program might look like:

    {
        "id": "myprogram",
        "include_type": "program",
        "command": "/path/to/myprogram"
    }

And a group might look like:

    {
        "id": "mygroup",
        "include_type": "group",
        "programs": "myprogram,myotherprogram"
    }

Usage
=====

Create a Role and override the attributes to fit your needs. An example role might look like:

    name "my_supervisord_role"
    description "Sample Supervisord role"
    run_list(
      "recipe[supervisord::default]",
      "recipe[supervisord::includes]"
    )

    override_attributes(
      "supervisord" => {
        "data_bag_items" => [
            "myprogram_data_bag_item",
            "myotherprogram_data_bag_item",
            "mygroup"
        ]
      }
    )

License and Author
==================

Author:: Brad Montgomery (<bmontgomery@coroutine.com>)
Author:: Stephen (<stephen@atalanta-systems.com>)

Copyright 2011, Atalanta Systems Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
