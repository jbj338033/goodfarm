# /bin/bash

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git curl openjdk@21 gh azure-cli
git clone https://github.com/hackersground-kr/hg-team-garlic.git
mv hg-team-garlic garlic
cd garlic/server
# ./gradlew bootJar -x test
curl -fsSL https://aka.ms/install-azd.sh | bash
azd auth login
cd ..
azd init -e garlic
# azd up
rm -rf .git
git init
git add .
git commit -m 'Initial commit'
open https://github.com/new
git remote add origin $(pbpaste)
git push origin main
open https://portal.azure.com/#@hackersground.kr/resource/subscriptions/bfa39d86-1058-4824-8074-e9d283d6c321/resourceGroups/rg-common-hackergroud/providers/Microsoft.CognitiveServices/accounts/rg-common-openai-east/cskeys
azd pipeline config

# - name: Inject Secrets into YAML
#         run: |
#           sed -i 's#{KEY}#${{ secrets.AZURE_OPENAI_API_KEY }}#' server/src/main/resources/application.yml
#           sed -i 's#{ENDPOINT}#${{ secrets.AZURE_OPENAI_ENDPOINT }}#' server/src/main/resources/application.ym