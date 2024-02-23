#!/bin/bash 
# Query to retrieve active scratch orgs
query="SELECT Id, Name, SignupUsername FROM ScratchOrgInfo WHERE OrgName='TestScracth' AND Status = 'Active' LIMIT 1"

# Variables
devHubAlias="devHub"
scratchOrgName="TestScracth"

# Function to check if scratch org exists
check_scratch_org() {
  sf data query --query "${query}" --target-org "${devHubAlias}" --json
}

# Check if scratch org exists
scratch_org_id=$(check_scratch_org)

# Parse JSON response to extract scratch org ID
scratch_org_id=$(echo "$scratch_org_id" | json "result.records['0'].Id") 

if [ -n "$scratch_org_id" ]; then
  echo "Scratch org found, setting as default" 
  sfdx force:config:set defaultusername="$scratchOrgId"
else
  echo "Scratch org is not there, creating a new one"
  # Crear la scratch org
  sf org create scratch  --definition-file config/project-scratch-def.json  --alias "$scratchOrgName" --duration-days 1 --set-default  
fi
