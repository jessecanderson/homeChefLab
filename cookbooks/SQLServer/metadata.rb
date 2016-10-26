name             'SQLServer'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures SQLServer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends          'apt'
depends          'mysql', "~> 8.0.0"
# depends          'mysql2_chef_gem', '~> 1.1'
