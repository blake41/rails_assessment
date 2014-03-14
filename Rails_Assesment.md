**My solution:**
https://github.com/MProuts/rails_assessment

**How does rails communicate with the database?  Please be thorough in discussing all the config files and pieces of rails necessary to communicate with the database.**
- ActiveRecord Databbase Connections are established based on informations provided in config/database.yml.
- Migrations in db/migrations create the structure of the database when they are run via rake tasks (rake db:migrate RAILS_ENV=<something>)
- Once the database is migrated, models that inherit from ActiveRecord::Base (usually in app/models/) will have an implicit connection to database tables whose names are a plural version of the model 
(e.g. class Artist < ActiveRecord::Base ; end will read and write instance information from a table named "artists")

**What is a resource?**
- An object with an HTTP interface

**What are the standard RESTful routes for a resource?**
get '/resources' => 'resources#index'  
post '/resources' => 'resources#create'  
get '/resources/new' => 'resources#new', :as => "new_resource"  
get '/resources/:id/edit' => 'resources#edit', :as => 'edit_resource'  
get '/resources/:id' => 'resources#show', :as => 'resource'  
patch '/resources/:id' => 'resources#update'  
delete '/resouces/:id' => 'resources#destroy'   

**What is CRUD?**
List of standard actions you can perform on a database record.  
(C)reate  
(R)ead  
(U)date  
(D)estroy  

**What is REST?**
Representational State Transfer  
Philosophy about how URLs should map onto underlying application resources.  Implemented in most rails apps.

**What is the difference between CRUD and REST?**
CRUD is about doing things to resources.  
Rest is about representing resources and the things you can do to them in a logical way. (Given HTTP protocol)

**Describe the flow of a request from a users browser through the rails stack and back.**
Client (Browser) => Server => Rack => Middlewear => Rails( == Middlewear) => Route => Controller Action => Model (ActiveRecord == ORM) => Database
(and reverse)

**What are HTTP verbs?**
Actions associated with low levels messages sent between clients and servers.  Modern browsers only implement support for two -- GET (request to read information stored on server)  POST (request to update information on server)

**Why do we use migrations?**
To have grandular control over the state of our database.  To make our project portable, as we don't version control the database.  (let other developers easily create same database structure on their local machines).
