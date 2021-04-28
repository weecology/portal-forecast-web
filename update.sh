# Get most recent version of repo
git pull origin main

# Update data files
R --vanilla -e 'portalcasting::fill_dir()'