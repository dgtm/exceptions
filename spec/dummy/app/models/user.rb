class User
  include ::Mongoid::Document
  include Exceptions::Handler

  field :name

  def raise_exception
    execute "While Processing" do
      raise StandardError, "Error from User"
    end
  end
end