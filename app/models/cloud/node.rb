module Cloud
  class Node
    attr_reader :name, :cluster_name, :full_node_name, :public_ip, :private_ips, :instance_id

    def initialize(data)
      @name, @cluster_name = data.name.split(".").first, data
      @public_ip = case
      when data["ec2"]
        data["ec2"]["public_ipv4"]
      else
        data.ipaddress
      end
      @instance_id = data["ec2"]["instance_id"] if data["ec2"]
      self
    end

    def self.extract_cluster_name( node )
      cluster_name = node.name.split(".")[1..-1].join(".")
      Rails.logger.debug "EXTRACT: Given #{node.name} I got #{cluster_name}"
      cluster_name
    end

  end
end