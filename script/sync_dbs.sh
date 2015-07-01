heroku pgbackups:capture --expire --app mememenu-production
heroku pgbackups:restore DATABASE_URL `heroku pgbackups:url --app mememenu-production` --app $CURRENT_APP --confirm $CURRENT_APP
