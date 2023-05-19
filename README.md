db設計

 ## Users_table 
      
  |         Column      |       Type      |    Option                |     
  |---------------------|-----------------|--------------------------|    
  |       nickname      |     string      |null: false, unique: true |
  |---------------------|-----------------|--------------------------|   
  |        email        |     string      |null: false, unique: true |
  |---------------------|-----------------|--------------------------|      
  | encrypted_password  |     string      |null: false, unique: true |
  |---------------------|-----------------|--------------------------|
  |    last_name        |     string      |null: false               |
  |---------------------|-----------------|--------------------------|  
  |    first_name       |     string      |null: false               |
  |---------------------|-----------------|--------------------------|
  |    last_name_kana   |     string      |null: false               |
  |---------------------|-----------------|--------------------------|  
  |    first_name_kana  |     string      |null: false               |
  |---------------------|-----------------|--------------------------|
  |     birthday        |     date        |null: false               |

  ### Association 
   - has_many : items
   - has_many : orders


  ## items_table

  |       Column        |       Type      |    Option                  |     
  |---------------------|-----------------|----------------------------|    
  |        name         |     string      |  null: false               |
  |---------------------|-----------------|----------------------------|
  |        text         |      text       |   null: false              |
  |---------------------|-----------------|----------------------------|   
  |     category_id	    |     integer     |  	null: false              |
  |---------------------|-----------------|----------------------------|
  |         price       |    integer      |    null:false              |
  |---------------------|-----------------|----------------------------|
  |   condition_id      |    integer      |   null:false               |
  |---------------------|-----------------|----------------------------|  
  |   delivery_fee_id   |     integer     |  null: false               |
  |---------------------|-----------------|----------------------------|
  |      prefecture_id  |    integer      |   null: false              |
  |---------------------|-----------------|----------------------------|   
  |    delivery_day_id  |    integer      |  null:false                |
  |---------------------|-----------------|----------------------------|      
  |       user          |   references    | null:false,foreign_key:true|

  ### Association 
  - belongs_to : user
  - has_one    : order

  ## Orders_table

  |         Column      |       Type      |    Option                    |   
  |---------------------|-----------------|------------------------------|
  |         user        |   references    | null:false,foreign_key:true  |
  |---------------------|-----------------|------------------------------|   
  |         item        |   references    | null:false,foreign_key:true  |
  |---------------------|-----------------|------------------------------|   

  ### Association 
  - belongs_to : user
  - belongs_to : item
  - has_one    : address
  

  ## Addresses_table
   |         Column      |       Type      |    Option                   |
   |---------------------|-----------------|-----------------------------|
   |     postal_cord     |     string      |    null:false               |
   |---------------------|-----------------|-----------------------------| 
   |    prefecture_id	   |     integer	   |    null: false              |
   |---------------------|-----------------|-----------------------------|
   |        city	       |     string	     |    null: false              |
   |---------------------|-----------------|-----------------------------|
   |      house_number   |    	string     |   	null: false              |
   |---------------------|-----------------|-----------------------------|
   |       building	     |      string	   |                             |
   |---------------------|-----------------|-----------------------------|
   |    phone_number	   |      string	   |    null: false              |
   |---------------------|-----------------|-----------------------------|
   
  ### Association 
  - has_one  : order
      