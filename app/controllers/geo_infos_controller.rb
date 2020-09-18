class GeoInfosController < ApplicationController
    def index
      # @country_group_type = CountryGroupType.new
      # @country_group_type.country_groups.new
      @country_groups = CountryGroup.all
    end

  def new
    @country_group = CountryGroup.new
  end

  def create
    @country_group = CountryGroup.new(country_group_params)


      respond_to do |format|
        if @country_group.save
          format.html { redirect_to @country_group, notice: 'country_@country_group was successfully created.' }

        else
          format.html { render :new }
        end
      end

  end

  private

  def country_group_params
    params.require(:country_group).permit(:name, :active,  country_group_type_attributes: [:name])
  end
end
# def create
#   @enrollment = Enrollment.new(enrollment_params)
#   @enrollment.clazz_id = @clazz.id
#   @enrollment.student_id = @student.id
#   @enrollment.save
# end

# private
#   def enrollment_params
#     params.require(:enrollment).permit(:payment_token, :agreed_to_terms, student_attributes: [:payment_name])
#   end
# end