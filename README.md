# guard-gulp

Guard::Gulp is a [Guard](http://guardgem.org/) plugin to automatically
start/stop/restart gulp.

### Getting Started

If you're using Bundler, you can add guard-gulp to your Gemfile:

```ruby
gem 'guard-gulp'
```

Or manually install the guard-gulp gem:

```shell
gem install guard-gulp
```

Add the guard definition to your Guardfile by running this command:

```shell
guard init gulp
```

Don't forget to [install
Gulp](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md#getting-started)!

### Guardfile

```ruby
guard 'gulp' do
  watch(%r{^gulpfile.js$})
end
```

### Contributing

Fork, branch, and pull-request.
