# kttfaws
This project shows how to use kitchen-terraform and inspec-aws (started off from kttfazure/kttfsample).

Branch `tfdatasource` is setup to demonstrate the issue discussed in https://discuss.hashicorp.com/t/terraform-0-13-handling-of-data-source-data-resource-reads-can-no-longer-be-disabled-by-refresh-false/18457 and also in the issue https://github.com/hashicorp/terraform-provider-aws/issues/11554.

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



OR JUST USE:
```
cd test/fixtures/default
terraform apply
```
