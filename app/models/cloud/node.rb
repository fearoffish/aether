module Cloud
  class Node
    attr_reader :name, :cluster_name, :full_node_name, :public_ips, :private_ips, :instance_id

    def initialize(data)
      @name, @cluster_name = data.name.split(".").first, data.name.split(".")[1..-1].join(".")
      @public_ips = data["cloud"]["public_ips"]
      @private_ips = data["cloud"]["private_ips"]
      @instance_id = data["ec2"]["instance_id"] if data["ec2"]
    end

  end
end