# Get most recent version of repo
git pull origin main

# Update data files
R -e "library(portalcasting); update_dir(settings = production_settings())"
