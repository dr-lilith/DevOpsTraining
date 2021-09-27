#ROLL BACK 1.0.1 TAG
cd ~
git clone https://github.com/dr-lilith/PowerShell-training.git ./devopsHomeworkIrina > "&1"
cd ./devopsHomeworkIrina

"Deleting tag 1.0.1"

git tag --delete 1.0.1 > "&1"
git push origin --delete 1.0.1 > "&1"

"Cleaning up the cloned repo."
cd ~
rmdir ./devopsHomeworkIrina -r -Force
"Done"
