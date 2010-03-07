require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class Country < StaticResource::Base
  self.static_resource = File.expand_path(File.dirname(__FILE__) + "/country.xml")
end

class StaticResourceTest < Test::Unit::TestCase

  def test_static_resource_assignment
    assert_equal(File.expand_path(File.dirname(__FILE__) + "/country.xml"), Country.static_resource)
  end

  def test_connection_type
    assert_instance_of(StaticResource::Connection, Country.connection)
  end

  def test_find_without_xml_file
    assert_not_nil(Country.find(:one))
  end

  def test_find_with_xml_file
    assert_not_nil(StaticResource::Base.find(:one, :from => File.expand_path(File.dirname(__FILE__) + "/os.xml")))
  end

  def test_find_expects_find_one
    file = File.expand_path(File.dirname(__FILE__) + "/os.xml")
    StaticResource::Base.expects(:find_one).with({:from => file})
    StaticResource::Base.find(:one, :from => file)
  end

  def test_find_expects_find_all
    file = File.expand_path(File.dirname(__FILE__) + "/states.xml")
    StaticResource::Base.expects(:find_every).with({:from => file})
    StaticResource::Base.find(:all, :from => file)
  end

  def test_find_expects_find_last
    file = File.expand_path(File.dirname(__FILE__) + "/states.xml")
    resource = StaticResource::Base.find(:last, :from => file)
    assert_equal(resource.attributes["name"], "California")
  end

  def test_find_expects_find_first
    file = File.expand_path(File.dirname(__FILE__) + "/states.xml")
    resource = StaticResource::Base.find(:first, :from => file)
    assert_equal(resource.attributes["name"], "Illinois")
  end

  def test_connection_get_method
    file = File.expand_path(File.dirname(__FILE__) + "/os.xml")
    connection = StaticResource::Connection.new(ActiveResource::Formats[:xml])
    connection.format.expects(:decode)
    connection.get(file, nil)
  end

  def test_connection_request_expects_file_read
    file = File.expand_path(File.dirname(__FILE__) + "/os.xml")
    connection = StaticResource::Connection.new(ActiveResource::Formats[:xml])
    File.expects(:read).with(file)
    connection.send(:request, nil, file, nil)
  end

  def test_find_with_id_lookup
    file = File.expand_path(File.dirname(__FILE__) + "/os.xml")
    resource = StaticResource::Base.find(:one, :id => "linux", :from => file)
    assert_equal(resource.description, "love it")
  end

  def test_find_all_with_id_and_key_lookup
    file = File.expand_path(File.dirname(__FILE__) + "/states.xml")
    resource = StaticResource::Base.find(:all, :id => "Illinois", :key => "name", :from => file)
    assert_equal(resource.name, "Illinois")
  end
end
