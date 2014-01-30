require 'aruba/cucumber'
require 'cucumber/rspec/doubles'
require 'git'
require 'fileutils'

require 'coveralls'
Coveralls.wear_merged!

require 'badger/badger'

$temp_repo = '/tmp/wow_repo'