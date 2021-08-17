# README

## TinyURL APP

* Ruby version - 2.6.0

* Rails version - 6.0.4

* Database - Mysql

* Database creation steps
    - rake db:create
    - rake db:migrate
    - rake db:seed

* Start Server
     - rails s

* To Run the application follow below steps:
     - Generate tiny url of your link by clicking on 'Generate Link' button.
     - Copy the generated url and paste it in your browser and it will redirect you to original url.
     - User following route to check visitors of your link.
       > {host}/:token/info
    
