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

```******_create_users.rb
t.string  :name, index: true, null:false 
t.text    :email, index: true, null:false
t.string  :password, null:false
```
#### users_groups table

```******_create_users_groups.rb
t.references  :user, foreign_key: true
t.references  :group, foreign_key: true
```

#### groups table 

```******_create_groups.rb
t.string  :groups_name, null:false
```

#### messages table 

```******_create_messages.rb
t.text    :body, null:false
t.text    :image
t.references  :group, foreign_key: true
t.references  :user, foreign_key: true
```

