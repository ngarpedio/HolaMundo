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



echo "$scratch_org_id"