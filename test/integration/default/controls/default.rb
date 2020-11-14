fixture_output1 = input('output_fixture_output')

pp "***************************"
pp "pp fixture_output1"
pp fixture_output1

tfoutput_json_helper = JSON.generate(fixture_output1.first)
tfoutput_json = JSON.parse(tfoutput_json_helper, {:symbolize_names => false})
pp "#*#*#*#*#*#*#"
bucket = tfoutput_json['bucket_module'].first['bucket']
pp bucket
pp "#*#*#*#*#*#*#"
#role_name = tfoutput_json['role_definition'].first['name']
#pp role_name
#pp "#*#*#*#*#*#*#"


control 'sdk_check' do
  s3            = Aws::S3::Client.new()
  s3_versioning = s3.get_bucket_versioning({ bucket: bucket })
  describe 'S3 Bucket' do
    context "versioning" do
       it { expect(s3_versioning.status).to cmp "Enabled" }
    end
  end
end

control 'aws_profile_check' do
  describe aws_s3_bucket(bucket_name: bucket) do
    it { should exist }
    it { should_not be_public }
  end
end
