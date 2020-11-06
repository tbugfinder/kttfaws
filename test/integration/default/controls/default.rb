fixture_output1 = input('output_fixture_output')

pp "***************************"
pp "pp fixture_output1"
pp fixture_output1

tfoutput_json_helper = JSON.generate(fixture_output1.first)
tfoutput_json = JSON.parse(tfoutput_json_helper, {:symbolize_names => false})
pp "#*#*#*#*#*#*#"
role_id=tfoutput_json['role_definition'].first['role_definition_resource_id']
pp role_id
pp "#*#*#*#*#*#*#"
role_name = tfoutput_json['role_definition'].first['name']
pp role_name
pp "#*#*#*#*#*#*#"

control 'generictest_id' do
  describe azure_generic_resource(resource_id: role_id) do
    it { should exist }
    its('properties.permissions.first.actions') { should cmp ["*"] }   #access array using .first
    its('properties.permissions.first.actions') { should include '*' }
  end
end

control 'generictest_name' do
  describe azure_generic_resource(name: role_name) do # doesn't create valid URI
    it { should exist }
  end
end

control 'resourcetest' do
  #describe azure_role_definition(name: role_name) do
  describe azure_role_definition(resource_id: role_id) do
    it { should exist }
    its('properties.permissions.first.actions') { should include '*'}
    its('permissions_allowed') { should include 'Microsoft.Authorization/policyassignments/read'}
    its('permissions_allowed') { should_not include 'Microsoft.Authorization/policyassignments/write'}
    its('permissions_allowed') { should include '*'}
  end
end
