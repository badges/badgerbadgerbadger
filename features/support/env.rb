require 'aruba/cucumber'
require 'cucumber/rspec/doubles'
require 'git'
require 'fileutils'
require 'coveralls'

require 'badger/badger'

$temp_repo = '/tmp/wow_repo'

Coveralls.wear_merged!
