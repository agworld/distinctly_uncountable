if Post.count == 0
  data = "aa"
  srand(0)
  (1..1000).each do 
    Post.create(name: data.next!, title: data.next!, content: data.next!, number: rand(1..10).to_i)
  end
end
