fixture_output1 = input('output_fixture_output')

pp "***************************"
pp "pp fixture_output1"
pp fixture_output1

role_id = JSON.generate(fixture_output1.first)
role_id_h = JSON.parse(role_id, {:symbolize_names => false})
pp "#*#*#*#*#*#*#"
new_id=role_id_h['role_definition'].first['id']
pp new_id
new_id_clean = new_id.gsub("|",'')
pp "#*#*#*#*#*#*#"

control 'generictest' do
#  describe azure_generic_resource(resource_id: new_id) do # resource_id only supports resourceGroup objects
#  describe azure_generic_resource(name: role_id_h['role_definition'].first['name'], resource_provider: 'Microsoft.Authorization/roleDefinitions') do # empty
#  describe azure_generic_resource(name: role_id_h['role_definition'].first['name'], resource_uri: '/providers/Microsoft.Authorization/roleDefinitions/'+role_id_h['role_definition'].first['role_definition_id']), add_subscription_id: true) do # implicit conversion from symbol to integer
  describe azure_generic_resource(name: role_id_h['role_definition'].first['name'], resource_uri: new_id_clean, add_subscription_id: false) do # implicit conversion from symbol to integer
    it { should exist }
    #its('property') { should eq 'value' }
  end
end

control 'resourcetest' do
  describe azurerm_role_definition(name: role_id_h['role_definition'].first['name']) do
    it { should exist }
#    its('permissions_allowed') { should include 'Microsoft.Authorization/policyassignments/read'}
#    its('permissions_allowed') { should_not include 'Microsoft.Authorization/policyassignments/write'}
#    its('permissions_allowed') { should_not include '*'}
  end
end
