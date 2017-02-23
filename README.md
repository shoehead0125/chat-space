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

```ruby:******_create_users.rb
t.string  :name, index: true, null:false 
t.text    :email, index: true, null:false
t.string  :password, null:false
```

```ruby:user.rb
has_many :messesages
has_many :groups, :throuth => :group_ids
```


#### users_groups table 

```ruby:******_create_users_groups.rb 
t.references  :user, foreign_key: true
t.references  :group, foreign_key: true
```

```ruby:user_group.rb 
belongs_to :user
belongs_to :group
```

#### groups table 

```ruby:******_create_groups.rb 
t.string  :groups_name, null:false
```

```ruby:group.rb 
has_many :messages
has_many :users, :through => :user_ids
```

#### messages table 

```ruby:******_create_messages.rb 
t.text    :body, null:false
t.text    :image
t.references  :group, foreign_key: true
t.references  :user, foreign_key: true
```

```ruby:message.rb 
belongs_to :user
belongs_to :group
```

