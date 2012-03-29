maintainer       "Atalanta Systems Ltd"
maintainer_email "stephen@atalanta-systems.com"
license          "Apache 2.0"
description      "Installs/Configures supervisord"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe           "supervisord::default", "Installs/Configures supervisord" 
recipe           "supervisord::includes", "Installs/Configures additional programs" 
