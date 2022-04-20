changed=0
git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
if [ $changed = 1 ]; then
    git pull
    R -e "install.packages('devtools', repos='https://cran.rstudio.com/')"
    R -e "devtools::install_github('weecology/portalcasting', upgrade = TRUE)"
else
    echo "Up-to-date $(date)"
fi
