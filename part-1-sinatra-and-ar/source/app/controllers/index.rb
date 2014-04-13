get '/' do
  # render home page

  @users = User.all
  erb :index
end


post '/' do
  @user = current_user # this is here so we can fill out the info on line 11
  Skill.create!(name: params[:name], context: params[:context])  # when adding a skill - we have to create a new skill using the params and make the association
  UserSkill.create(user_id: @user.id, skill_id: Skill.last.id, years: params[:years], formal: params[:formal])
  redirect '/'  # we redirect here ### this produces anothe get request (line 1) which redoes line 4 so that we can iterate over @users in erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

get '/show' do
  @user = current_user
  erb :'user/show'
end




#----------- SKILLS -----------

get '/new' do
  erb:'/skill/new'
end


get '/edit/:id' do
  @user = current_user  # for user_skill update
  @skill = Skill.find(params[:id])
  erb:'skill/edit'
end


post '/edit/:id' do    #this was made to to the update required for an effect edit - not we have a get and post (line 83)
  @user = current_user  # for user_skill update

  @skill = Skill.find(params[:skill_id])  #remeber the name in the hiddin input in the edit form!!
  # @skill.update(name: params[:name], context: params[:context])
  @skill.name = params[:name]
  @skill.context = params[:context]
  @skill.save
  
  @user_skill = @skill.user_skills.first
  @user_skill.years = params[:years]
  @user_skill.formal = params[:formal]
  @user_skill.save
  # @user_skill.update(user_id: @user.id, skill_id: @skill.id, years: params[:years], formal: params[:formal])
  redirect '/show' # When we edit a skill we want to go back to the user profile so we can see the changes
end




