module Booze
  class QueryStore

    # === Description
    # Get a Regexp to filter SQL statements by. If the SQL statement
    # matches this filter, it won't be counted.
    #
    # === Returns
    # Regexp, or nil
    def self.filter
      return @@filter if defined?(@@filter)
      @@filter = /pragma/i if Booze.config.filter_pragma_queries
      @@filter ||= nil
    end

    # === Description
    # Add a query
    #
    # === Parameters
    # sql - String, SQL statement for the query
    def self.add(sql)
      return if filter && sql.match(filter)
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
