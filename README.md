# chat-space 

## Install 

### requirements 

- Ruby 2.3.1
- Bundler 1.14.5
- Rails 5.0.1

### set up 

### run 

### darabase design 

#### users table 
name:     string  null:false add_index
email:    text    null:false add_index
password: string  null:false

#### users_groups
user_id:   string null:false
groups_id: string null:false

#### groups table 
name:     string  null:false add_index
user_id:  integer null:false

#### messages table 
body:     text    null:false
image:    string  
group_id: integer null:false
user_id:  integer null:false





