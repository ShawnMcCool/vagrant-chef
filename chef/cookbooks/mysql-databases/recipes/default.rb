# Set up client site database
if defined? node['databases'] then
    if defined? node['databases']['create'] then
        if node['databases']['create'].kind_of?(Array) then
            node['databases']['create'].each do |db_name|
                mysql_database db_name do
                  connection mysql_connection_info
                  action :create
                end
            end
        end
    end
end

mysql_database_user 'root' do
  connection mysql_connection_info
  password 'password'
  host '%'
  action :grant
end