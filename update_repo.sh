changed=0
git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
if [ $changed = 1 ]; then
    git reset --hard origin/main && git pull
    R -e "install.packages('remotes', repos='https://cran.rstudio.com/')"
    R -e "remotes::install_github('weecology/portalcasting@*release', upgrade = TRUE)"
    echo "Updated $(date)"
else
    echo "Up-to-date $(date)"
fi

# Update setup directory every friday
friday_start=52335
friday_end=52359
Current_time=$(date +"%u%H%M")
if [ $friday_start -le $Current_time ] && [ $friday_end -gt $Current_time ]
    then
        R -e "library(portalcasting); update_dir(settings = production_settings())">../cron_setup_dir.log
        echo "Directory is updated using update_dir $(date)">>../cron_setup_dir.log
    fi
