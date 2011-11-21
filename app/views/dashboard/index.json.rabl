collection @clusters => :cluster
child(:nodes => :nodes) do |node|
  attributes :name, :public_ip
end