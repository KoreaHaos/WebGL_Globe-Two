if [ -z $1 ]; then
    commit_message="Commited with script."
else
    commit_message=$1
fi
# git add --all :/
# git commit -m "$commit_message"
# git push --all
echo $commit_message
