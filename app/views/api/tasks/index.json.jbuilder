@tasks.each do |task| 
 json.name task.name 
 json.date task.date 
 json.time task.time 
 json.id task.user_id


end 