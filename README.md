# Simple Email Services - Starter
A simple cloud formation template to configure:
* SES with delivery to S3 and SNS notification.
* Route53 hosted zone with MX and DKIM records.

Read the [accompanying tutorial](#todo) at 
[Cloudy with a Chance of Formation](#todo).

## TLDR

```
# Copy and edit the parameters.example.json file.
cp parameters.example.json parameters.json

# Deploy the stack using the built in script.
# Note that this will deactivate any existing RuleSets
# as there can only be one active.
./deploy.sh
```

This does not register a domain.  

You will need to update nameserver (NS) records 
for your registration (if using a TLD) 
or within the parent zone if using a subzone.