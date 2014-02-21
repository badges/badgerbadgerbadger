Highly-opinionated badge generator for Github READMEs:

* If it finds a .travis.yml, it generates a Travis-CI Build-Status Badge

* If it finds a Gemfile or a gemspec, it generates a Gemnasium Dependency Status Badge

* If it finds 'coveralls' in a Gemfile or gemspec, it generates a Coveralls Coverage Status Badge

* If it's generated at least one of the above, it generates a Code Climate Status Badge

In addition, if it finds a gemspec, it will use it to generate:

* A Rubygems Version Badge

* A License Badge (or Badges)

And if a license file is found, a License Badge will be generated. Currently supported licenses are:

* MIT

* Apache

* GPL-2

* GPL-3

The supported license details are in `https://github.com/badges/badgerbadgerbadger/blob/master/config/licenses.yaml`, if you're using a different license, send a PR! And if your gemspec license conflicts with your LICENSE file, you should probably fix that.