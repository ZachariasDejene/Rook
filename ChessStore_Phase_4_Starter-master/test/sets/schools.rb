module Contexts
  module Schools
    # Context for schools
    def create_schools
      @s1 = FactoryGirl.create(:school)
      @s2 = FactoryGirl.create(:school, name: "MEMS Middle School", street_1: "700 Hill Rd", zip: "07726", min_grade: 3, max_grade: 7)
      @s3 = FactoryGirl.create(:school, name: "Saint John Vianney High School", street_1: "55 Grant Rd", zip: "15289", active: false)
    end
    
    def destroy_schools
      @s1.delete
      @s2.delete
      @s3.delete
    end

  end
end