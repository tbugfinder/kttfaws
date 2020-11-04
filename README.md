# kttfazure
This project should show how to use kitchen-terraform and inspec-azure (started off from kttfsample).

## Steps
- clone the repository
- install Gems using
```
BUNDLE_SILENCE_ROOT_WARNING=true bundle config --local path ./vendor/bundle
BUNDLE_SILENCE_ROOT_WARNING=true bundle install --jobs=8
```

- run verify
```
bundle exec kitchen verify
```
- destroy
```
bundle exec kitchen destroy
```
