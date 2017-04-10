module Contexts
  module Users
    # Context for both customer and employee users
    def create_customer_users
      @john   = FactoryGirl.create(:user, first_name: "John", last_name: "Smith", username: "jsmith")
      @steve  = FactoryGirl.create(:user, first_name: "Steve", last_name: "James", username: "sjames", phone: "412-688-4386")
      @paul = FactoryGirl.create(:user, first_name: "Paul", last_name: "Simon", username: "psimon", active: false)
    end
    
    def destroy_customer_users
      @john.delete
      @steve.delete 
      @paul.delete 
    end

    def create_employee_users
      @mike = FactoryGirl.create(:user, first_name: "Mike", last_name: "Ruth", username: "mruth", role: "shipper")
      @sarah  = FactoryGirl.create(:user, first_name: "Sarah", last_name: "Johnson", username: "sjohnson", role: "admin", phone: "732-733-9984")
      @nick = FactoryGirl.create(:user, first_name: "Nick", last_name: "Ng", username: "nng",role: "manager", active: false)
    end

    def destroy_employee_users
      @mike.delete
      @sarah.delete
      @nick.delete
    end

  end
end