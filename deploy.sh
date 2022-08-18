# Halt on any errors.
set -e

# Verify a parameter has been passed in for stack name.
if [ -z "$1" ]
  then
    echo "Usage: ./deploy.sh MyStackName"
  else
    # Running this without naming a ruleset disables all rulesets.
    # This can't be done within cloud formation without custom resources.
    # This allows renaming/replacing the ruleset which causes deletions.
    aws ses set-active-receipt-rule-set

    # Cloudformation updates the stack.
    aws cloudformation deploy \
      --capabilities CAPABILITY_AUTO_EXPAND \
      --stack-name $1 \
      --template-file template.yaml \
      --parameter-overrides file://parameters.json

    # We re-enable the ruleset.
    aws ses set-active-receipt-rule-set --rule-set-name MailProcessor
fi

