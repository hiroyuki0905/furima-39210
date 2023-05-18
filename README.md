db設計

 ## User_table 
      
  |         Column      |       Type      |    Option                |     
  |---------------------|-----------------|--------------------------|    
  |        name         |     string      |null: false               |
  |---------------------|-----------------|--------------------------|   
  |        email        |     string      |null: false, unique: true |
  |---------------------|-----------------|--------------------------|      
  | encrypted_password  |     string      |null: false               |
  |---------------------|-----------------|--------------------------|
  |    last_name        |    string       |null: false               |
  |---------------------|-----------------|--------------------------|  
  |    first_name       |     string      |null: false               |
  |---------------------|-----------------|--------------------------|
  |     birthday        |     date        |null: false               |

  ### Association 
   - has_many : item_table
   - has_many : Orders_table


  ## item_table

  |       Column        |       Type      |    Option                  |     
  |---------------------|-----------------|----------------------------|    
  |        name         |     string      |  null: false               |
  |---------------------|-----------------|----------------------------|
  |        text         |      text       |   null: false              |
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
  - belongs_to : User_table
  - has_many   : Orders_table


  ## Orders_table

  |         Column      |       Type      |    Option                    |   
  |---------------------|-----------------|------------------------------|
  |         user        |  references     | null:false,foreign_key:true  |
  |---------------------|-----------------|------------------------------|   
  |         item        |  references     | null:false,foreign_key:true  |
  |---------------------|-----------------|------------------------------|   

  ### Association 
  - belongs_to : User_table
  - belongs_to : Item_table
  - has_one    : address
  

  ## Address_table
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
   |      buy_record     |  	references	 |null: false, foreign_key:true|

  ### Association 
  - belongs_to : Oder_table
  - belongs_to : prefecture_id
      