cd ~
git clone https://github.com/dr-lilith/PowerShell-training.git ./devopsHomeworkIrina > "&1"
cd ./devopsHomeworkIrina

$oldVer = $null
$oldVer = git describe --tags --abbrev=0 --candidates=1
 
if($oldVer -eq $null)
{
    echo "Tag Not Found"
    echo "Creating initial tag"
    git tag -a "1.0.0" -m "Version" > "&1"
    git push origin 1.0.0 > "&1"
}
elseif($oldVer.StartsWith("1.0."))
{
    $lastMergeSha = git log --pretty=format:"%H" --merges -n 1
    "Last merge SHA: " + $lastMergeSha
    $lastTagSha = git rev-list --tags --max-count=1
    "Last tag SHA: " + $lastTagSha
    "Last version: " + $oldVer
    
    if ($lastMergeSha -ne $null -and $lastTagSha -ne $null -and $lastMergeSha -ne $lastTagSha)
    {
        $newVer = "1.0." + [string]([int]($oldVer.Split(".")[-1]) + 1)
        "Creating new version " + $newVer
        git tag -a $newVer -m "Version" > "&1"
        git push origin $newVer > "&1"
    }
    else { "No changes" }
}

"Cleaning up the cloned repo."
cd ~
rmdir ./devopsHomeworkIrina -r -Force
"Done"
