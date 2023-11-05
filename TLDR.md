# TLDR

## Extra mark 1

Start CloudShell

```bash

# Check identity
aws sts get-caller-identity

# Clone repo
git clone https://github.com/greenaussie/inf3701-wk-9-extra-points.git

# Change directory
cd inf3701-wk-9-extra-points

# Show git log
git log --oneline

# review the Cloudformation template we will deploy
less cloudformation-templates/infrastructure.yml # press 'q' to exit

# Deploy
scripts/010-deploy.sh
```

View outputs of stack to get URL and check works in browser. 

**Show tutor to get the mark!**

## Extra mark 2

```bash
# review the Cloudformation template noting commented out lines 382-453, 501-506 and 596-606
less cloudformation-templates/infrastructure.yml # press 'q' to exit

# uncomment lines 382-453, 501-506 and 596-606
sed -i -r -e '382,452s/^(\s+?)#/\1/' -e '501,506s/^(\s+?)#/\1/' -e '596,606s/^(\s+)#/\1/' cloudformation-templates/infrastructure.yml

# review the Cloudformation template noting lines 382-453, 501-506 and 596-606 are now uncommented
less cloudformation-templates/infrastructure.yml # press 'q' to exi

# Run the deploy script again to update the stack
scripts/010-deploy.sh
```

**Show tutor to get the mark!**

## Tidy up

```bash
scripts/099-delete.sh
```