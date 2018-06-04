class StatisticsController < ApplicationController
  before_action :verify_auth_header
  def sizes
    if @user.is_teacher
      number_of_projects = Project.all.size
      number_of_stages = Stage.all.size
      number_of_outcrops = Outcrop.all.size
      number_of_rocks = Rock.all.size
      number_of_samples = Sample.all.size
      number_of_structures = Structure.all.size
      number_of_users = User.all.size

      @response = {}
      @response['projects_size'] = number_of_projects
      @response['stages_size'] = number_of_stages
      @response['rocks_size'] = number_of_rocks
      @response['samples_size'] = number_of_samples
      @response['structures_size'] = number_of_structures
      @response['outcrops_size'] = number_of_outcrops
      @response['users_size'] = number_of_users
    else
      number_of_projects = Project.where(user_id: @user.uuid).all
      number_of_stages = Stage.where(project_id: @project_id).all
      number_of_stages = Outcrop.where(project_id: @project_id).all
    end
    render json: @response
  end

  def altitudes
   @outcrops = Outcrop.all
   first_category = 0
   second_category = 0
   third_category = 0
   fourth_category = 0
   five_category = 0
   sixth_category = 0
   for @outcrop in @outcrops
     if @outcrop.latitude > 0 && @outcrop.latitude < 200
        first_category = first_category + 1
     end
     if @outcrop.latitude > 200 && @outcrop.latitude < 500
       second_category = second_category + 1
     end
     if @outcrop.latitude > 500 && @outcrop.latitude < 1000
       third_category = third_category + 1
     end
     if @outcrop.latitude > 1000 && @outcrop.latitude < 2000
       fourth_category = fourth_category + 1
     end
     if @outcrop.latitude > 1000 && @outcrop.latitude < 2000
       five_category = five_category + 1
     end
     if @outcrop.latitude > 2000 && @outcrop.latitude < 3500
       sixth_category = sixth_category + 1
     end
   end


   @response = {}
   @response['one'] =  first_category
   @response['two'] =  second_category
   @response['three'] =  third_category
   @response['four'] =  fourth_category
   @response['five'] =  five_category
   @response['six'] =  sixth_category

   render json: @response

  end



  def stages_by_uf

    @response = {}
    @response['AC'] = 0
    @response['AL'] = 0
    @response['AM'] = 0
    @response['AP'] = 0
    @response['BA'] = 0
    @response['CE'] = 0
    @response['DF'] = 0
    @response['ES'] = 0
    @response['GO'] = 0
    @response['MA'] = 0
    @response['MG'] = 0
    @response['MS'] = 0
    @response['MT'] = 0
    @response['PA'] = 0
    @response['PB'] = 0
    @response['PE'] = 0
    @response['PI'] = 0
    @response['PR'] = 0
    @response['RJ'] = 0
    @response['RN'] = 0
    @response['RO'] = 0
    @response['RR'] = 0
    @response['RS'] = 0
    @response['SC'] = 0
    @response['SE'] = 0
    @response['SP'] = 0
    @response['RS'] = 0
    @response['TO'] = 0


    if @user.is_teacher
      @stages = Stage.all
    else
      @stages = Stage.all
    end

    for @stage in @stages
      if @stage.uf == 'AC'
        @response['AC'] = @response['AC'] + 1
      end
      if @stage.uf == 'AL'
        @response['AL'] = @response['AL'] + 1
      end
      if @stage.uf == 'AM'
        @response['AM'] = @response['AM'] + 1
      end
      if @stage.uf == 'AP'
        @response['AP'] = @response['AP'] + 1
      end
      if @stage.uf == 'BA'
        @response['BA'] = @response['BA'] + 1
      end
      if @stage.uf == 'CE'
        @response['CE'] = @response['CE'] + 1
      end
      if @stage.uf == 'DF'
        @response['DF'] = @response['DF'] + 1
      end
      if @stage.uf == 'ES'
        @response['ES'] = @response['ES'] + 1
      end
      if @stage.uf == 'GO'
        @response['GO'] = @response['GO'] + 1
      end
      if @stage.uf == 'MA'
        @response['MA'] = @response['MA'] + 1
      end
      if @stage.uf == 'MG'
        @response['MG'] = @response['MG'] + 1
      end
      if @stage.uf == 'MS'
        @response['MS'] = @response['MS'] + 1
      end
      if @stage.uf == 'MT'
        @response['MT'] = @response['MT'] + 1
      end
      if @stage.uf == 'PA'
        @response['PA'] = @response['PA'] + 1
      end
      if @stage.uf == 'PB'
        @response['PB'] = @response['PB'] + 1
      end
      if @stage.uf == 'PE'
        @response['PE'] = @response['PE'] + 1
      end
      if @stage.uf == 'PI'
        @response['PI'] = @response['PI'] + 1
      end
      if @stage.uf == 'PR'
        @response['PR'] = @response['PR'] + 1
      end
      if @stage.uf == 'RJ'
        @response['RJ'] = @response['RJ'] + 1
      end
      if @stage.uf == 'RN'
        @response['RN'] = @response['RN'] + 1
      end
      if @stage.uf == 'RO'
        @response['RO'] = @response['RO'] + 1
      end
      if @stage.uf == 'RR'
        @response['RR'] = @response['RR'] + 1
      end
      if @stage.uf == 'SC'
        @response['SC'] = @response['SC'] + 1
      end
      if @stage.uf == 'SE'
        @response['SE'] = @response['SE'] + 1
      end
      if @stage.uf == 'SP'
        @response['SP'] = @response['SP'] + 1
      end
      if @stage.uf == 'RS'
        @response['RS'] = @response['RS'] + 1
      end
      if @stage.uf == 'TO'
        @response['TO'] = @response['TO'] + 1
      end
    end

    render json: @response
  end

  def photos_list
    rock_photos = RockPhoto.all
    sample_photos = SamplePhoto.all
    structure_photos = StructurePhoto.all
    outcrop_photos = OutcropPhoto.all
    @response = {}
    @response['rock_photos'] = rock_photos
    @response['sample_photos'] = sample_photos
    @response['structure_photos'] = structure_photos
    @response['outcrop_photos'] = outcrop_photos
    render json: @response
  end
end
  