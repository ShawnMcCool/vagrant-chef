mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

# Set up client site databases and users
if defined? node['databases'] then

    if defined? node['databases']['create'] then
        if node['databases']['create'].kind_of?(Array) then

            node['databases']['create'].each do |db_name|

                mysql_database db_name do
                  connection mysql_connection_info
                  action :create
                end

                # setup users
                if defined? node['databases']['grant'] then
                    if node['databases']['grant'].kind_of?(Array) then
                      node['databases']['grant'].each do |user|
                        mysql_database_user user["user"] do
                          connection mysql_connection_info
                          password user["password"]
                          host user["host"]
                          action :grant
                        end
                      end
                    end
                end
            end

        end
    end
end

# add root - password
mysql_database_user 'root' do
  connection mysql_connection_info
  password 'password'
  host '%'
  action :grant
end