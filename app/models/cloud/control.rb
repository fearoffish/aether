module Cloud
  class Control
    def self.get_clusters
      search = Cloud::Search.new
      results = search.get_clusters

      results
    end
  end
end