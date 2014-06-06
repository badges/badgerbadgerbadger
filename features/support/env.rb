require 'aruba/cucumber'
require 'git'
require 'fileutils'
require 'coveralls'

require 'badger/badger'

$temp_repo = '/tmp/wow_repo'
$licenses_dir = File.join(File.dirname(__FILE__), 'fixtures/licenses')

Coveralls.wear_merged!
