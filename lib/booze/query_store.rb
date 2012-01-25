module Booze
  class QueryStore

    # === Description
    # Add a query
    #
    # === Parameters
    # sql - String, SQL statement for the query
    def self.add(sql)
      @@queries ||= []
      @@queries << sql
    end

    # === Description
    # Get all queries
    #
    # === Returns
    # Array of String SQL statements
    def self.all
      @@queries
    end

    # === Description
    # Clear all queries
    def self.clear
      @@queries = []
    end

  end
end
